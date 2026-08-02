# Deployment plan

## Goal

Deploy this Vite site from `tchajed/personal-website` to Cloudflare Pages, serve it at
`https://www.chajed.io`, and redirect `https://chajed.io/*` to the matching `www` URL.

The site currently builds successfully with `bun run build`; the output directory is `dist`.

## Important sequencing

Do **not** disable the existing GitHub Pages deployment or delete its DNS records first. Build and
verify the Cloudflare deployment, then cut DNS over. This keeps the current site available and gives
us a simple rollback.

## 1. Move the GitHub repository

In GitHub:

1. Rename `tchajed/personal-website` to `personal-website-old` under **Settings → General →
   Repository name**.
2. Make the old repository private under **Settings → General → Danger Zone → Change repository
   visibility**. GitHub may disable its public Pages site when this happens; that is okay as long as
   the Cloudflare `pages.dev` deployment is ready before the DNS cutover.
3. Create a new public repository named `tchajed/personal-website`.
4. In this checkout, add the new remote and push `main`:

   ```sh
   git remote add origin git@github.com:tchajed/personal-website.git
   git add .
   git commit -m "Initial website"
   git push -u origin main
   ```

Before committing, remove `public/CNAME` and `public/.nojekyll`. They are GitHub Pages control files
and are not needed by Cloudflare Pages.

## 2. Create and verify the Cloudflare Pages project

In the Cloudflare dashboard:

1. Open **Workers & Pages → Create application → Pages → Import an existing Git repository**.
2. Authorize/install the Cloudflare Pages GitHub app for `tchajed/personal-website` if prompted.
3. Select the repository and use:

   | Setting | Value |
   |---|---|
   | Project name | `personal-website` (or another available name) |
   | Production branch | `main` |
   | Framework preset | `Vite` |
   | Build command | `bun run build` |
   | Build output directory | `dist` |
   | Root directory | `/` |

4. Select **Save and Deploy**.
5. Verify the generated `https://<project-name>.pages.dev` URL, including:
   - `/`
   - `/publications/`
   - several `/papers/...` links
   - mobile layout and external links
6. Push a harmless test commit, if desired, to confirm automatic production deployments. Pull
   requests will receive preview deployments.

No Wrangler configuration or API token is needed for this Git-integrated static deployment.

## 3. Move authoritative DNS from Namecheap to Cloudflare

Cloudflare requires the apex domain (`chajed.io`) to use Cloudflare nameservers when it is attached
to a Pages project. Namecheap remains the registrar; only DNS hosting moves.

### Current records to preserve

The currently published DNS records include:

- Apex A records: GitHub Pages addresses `185.199.108.153` through `185.199.111.153`
- `www` CNAME: `tchajed.github.io`
- MX: `eforward1.registrar-servers.com` through `eforward5.registrar-servers.com`, with the existing
  priorities
- TXT: `v=spf1 include:spf.efwd.registrar-servers.com ~all`
- TXT: Keybase site verification
- TXT: Google site verification

The MX and TXT records are important: they support Namecheap email forwarding and domain
verification. Confirm every record in Namecheap **Advanced DNS** against Cloudflare's imported list;
do not rely only on the list above in case there are records not visible through public DNS.

Before changing nameservers, verify that Namecheap's email-forwarding service remains enabled when
using custom nameservers. Preserve all five MX records and the SPF TXT record, and test both inbound
forwarding and replies after cutover.

### Cloudflare setup

1. In Cloudflare, open **Domains → Onboard a domain** and enter `chajed.io`.
2. Choose the Free plan.
3. Review Cloudflare's DNS scan. Add any missing MX/TXT records from Namecheap.
4. Initially leave the imported GitHub Pages apex A records and `www` CNAME in place. That way the
   site continues to resolve during the nameserver transition.
5. Cloudflare will display two assigned nameservers. Keep this page open.

### Namecheap setup

1. Open **Domain List → chajed.io → Manage**.
2. Under **Nameservers**, choose **Custom DNS**.
3. Enter exactly the two nameservers assigned by Cloudflare, remove the Namecheap nameservers, and
   save.
4. Do not create glue/personal nameservers. After this change, DNS records are managed in Cloudflare,
   not in Namecheap's **Advanced DNS** screen.
5. Wait until Cloudflare marks the zone **Active**. Nameserver propagation can take time.

Check before proceeding:

```sh
dig +short NS chajed.io
```

The result should be the two Cloudflare nameservers, not `dns1.registrar-servers.com` and
`dns2.registrar-servers.com`.

## 4. Attach the production domains

After the Cloudflare zone is active:

1. Open the Pages project → **Custom domains → Set up a custom domain**.
2. Add `www.chajed.io`. Let Cloudflare replace the old `www → tchajed.github.io` record with the
   Pages CNAME.
3. Add `chajed.io`. Let Cloudflare replace the four old GitHub Pages A records with the Pages record.
4. Wait for both domain entries to show **Active** and for their TLS certificates to be issued.
5. Add a Cloudflare **Redirect Rule** for the apex:
   - Match hostname: `chajed.io`
   - Static target: `https://www.chajed.io`
   - Preserve query string: yes
   - Preserve the path (for example, `/publications/` must redirect to
     `https://www.chajed.io/publications/`)
   - Status: `301`

The `www` hostname is the canonical hostname already used in this site's HTML and Keybase proof.

## 5. Validate the cutover

Run these checks from a terminal and also test in a private browser window:

```sh
curl -I https://www.chajed.io/
curl -I https://www.chajed.io/publications/
curl -I https://chajed.io/publications/
dig +short NS chajed.io
dig +short MX chajed.io
dig +short TXT chajed.io
```

Expected results:

- `www` returns `200` over HTTPS.
- The apex returns `301` to the same path on `www`.
- The Cloudflare nameservers are authoritative.
- All Namecheap forwarding MX records and the SPF/verification TXT records remain present.
- Sending a test message to every address forwarded by Namecheap still works.
- A new push to `main` creates and publishes a successful Pages deployment.

Once all checks pass, disable any remaining GitHub Pages deployment on `personal-website-old`.

## Rollback

Until the old repository/deployment is removed, rollback is straightforward:

1. Restore the old GitHub Pages A records and `www` CNAME in Cloudflare DNS.
2. Remove or deactivate the Pages custom domains/redirect rule.
3. If DNS itself is the problem, restore Namecheap BasicDNS nameservers, understanding that this can
   take another propagation interval.

Keep the old repository and its deployment available until the Cloudflare site, redirects, TLS, and
email forwarding have all been verified.

## Access needed for assisted execution

To let an assistant complete the Cloudflare steps, use one of these rather than sharing a password or
global API key:

- Sign in interactively to the Cloudflare dashboard and approve the GitHub app; or
- Provide a scoped Cloudflare API token with Pages edit plus DNS/zone edit access for `chajed.io`.

The Namecheap nameserver change is best completed interactively by the account owner because it may
require 2FA. The exact two nameserver values cannot be filled in until Cloudflare onboards the zone.
