export const papers = [
  { key: "basilisk:osdi2025", title: "Basilisk: Using Provenance Invariants to Automate Proofs of Undecidable Protocols", venue: "OSDI 2025", year: 2025, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tony Nuda Zhang, Keshav Singh, Tej Chajed, Manos Kapritsos, and Bryan Parno", pdf: "/papers/basilisk:osdi2025.pdf", code: "https://github.com/GLaDOS-Michigan/Basilisk" },
  { key: "verus:osdi2024", title: "Verus: A Practical Foundation for Systems Verification", venue: "SOSP 2024", year: 2024, book: "ACM Symposium on Operating Systems Principles", authors: "Andrea Lattuada, Travis Hance, Jay Bosamiya, Matthias Brun, Chanhee Cho, Hayley LeBlanc, Pranav Srinivasan, Reto Achermann, Tej Chajed, Chris Hawblitzel, Jon Howell, Jacob R. Lorch, Oded Padon, and Bryan Parno", pdf: "/papers/verus:sosp2024.pdf", code: "https://github.com/verus-lang/verus" },
  { key: "shadow-fs:hotstorage2024", title: "Shadow Filesystems: Recovering from Filesystem Runtime Errors via Robust Alternative Execution", venue: "HotStorage 2024", year: 2024, book: "ACM Workshop on Hot Topics in Storage and File Systems", authors: "Jing Liu, Xiangpeng Hao, Andrea Arpaci-Dusseau, Remzi Arpaci-Dusseau, and Tej Chajed", pdf: "/papers/shadow-fs:hotstorage2024.pdf" },
  { key: "absint-fo:cav2024", title: "Efficient Implementation of an Abstract Domain of Quantified First-Order Formulas", venue: "CAV 2024", year: 2024, book: "Computer Aided Verification", authors: "Eden Frenkel, Tej Chajed, Oded Padon, and Sharon Shoham", pdf: "/papers/absint-fo:cav2024.pdf", code: "https://github.com/vmware-research/temporal-verifier" },
  { key: "anvil:osdi2024", title: "Anvil: Verifying Liveness of Cluster Management Controllers", venue: "OSDI 2024", year: 2024, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Xudong Sun, Wenjie Ma, Jiawei Tyler Gu, Zicheng Ma, Tej Chajed, Jon Howell, Andrea Lattuada, Oded Padon, Lalith Suresh, Adriana Szekeres, and Tianyin Xu", pdf: "/papers/anvil:osdi2024.pdf", code: "https://github.com/vmware-research/verifiable-controllers" },
  { key: "kondo:osdi2024", title: "Inductive Invariants That Spark Joy: Using Invariant Taxonomies to Streamline Distributed Protocol Proofs", venue: "OSDI 2024", year: 2024, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tony Nuda Zhang, Travis Hance, Manos Kapritsos, Tej Chajed, and Bryan Parno", pdf: "/papers/kondo:osdi2024.pdf", code: "https://github.com/GLaDOS-Michigan/Kondo" },
  { key: "beyond-isolation:hotos2023", title: "Beyond isolation: OS verification as a foundation for correct applications", venue: "HotOS 2023", year: 2023, book: "Workshop on Hot Topics in Operating Systems", authors: "Matthias Brun, Reto Achermann, Tej Chajed, Jon Howell, Gerd Zellweger, and Andrea Lattuada", pdf: "/papers/beyond-isolation:hotos2023.pdf" },
  { key: "dbsp:vldb2023", title: "DBSP: Automatic Incremental View Maintenance for Rich Query Languages", venue: "VLDB 2023", year: 2023, book: "Very Large Databases Conference", authors: "Mihai Budiu, Tej Chajed, Frank McSherry, Leonid Ryzhyk, and Val Tannen", pdf: "/papers/dbsp:vldb2023.pdf" },
  { key: "chajed:thesis2022", title: "Verifying a concurrent, crash-safe file system with sequential reasoning", venue: "PhD Thesis, MIT 2022", year: 2022, book: "", authors: "Tej Chajed", pdf: "/papers/tchajed-thesis.pdf", code: "https://github.com/mit-pdos/perennial", slides: "/papers/tchajed-thesis-slides.pdf", thesis: true },
  { key: "daisy-nfs:osdi2022", title: "Verifying the DaisyNFS concurrent and crash-safe file system with sequential reasoning", venue: "OSDI 2022", year: 2022, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, Mark Theng, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/daisy-nfs:osdi2022.pdf", code: "https://github.com/mit-pdos/daisy-nfsd", slides: "/papers/daisy-nfs:osdi2022-slides.pdf" },
  { key: "gojournal:osdi2021", title: "GoJournal: a verified, concurrent, crash-safe journaling system", venue: "OSDI 2021", year: 2021, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, Mark Theng, Ralf Jung, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/gojournal:osdi2021.pdf", code: "https://github.com/mit-pdos/go-journal", slides: "/papers/gojournal:osdi2021-slides.pdf" },
  { key: "coq-record-update:coqpl2021", title: "Record Updates in Coq", venue: "CoqPL 2021", year: 2021, book: "International Workshop on Coq for Programming Languages", authors: "Tej Chajed", pdf: "/papers/coq-record-update:coqpl2021.pdf", code: "https://github.com/tchajed/coq-record-update", slides: "/papers/coq-record-update:coqpl2021-slides.pdf" },
  { key: "goose:coqpl2020", title: "Verifying concurrent Go code in Coq with Goose", venue: "CoqPL 2020", year: 2020, book: "International Workshop on Coq for Programming Languages", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/goose:coqpl2020.pdf", code: "https://github.com/mit-pdos/perennial", slides: "/papers/goose:coqpl2020-slides.pdf" },
  { key: "perennial:sosp2019", title: "Verifying concurrent, crash-safe systems with Perennial", venue: "SOSP 2019", year: 2019, book: "ACM Symposium on Operating Systems Principles", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/perennial:sosp2019.pdf", code: "https://github.com/mit-pdos/perennial", slides: "/papers/perennial:sosp2019-slides.pdf" },
  { key: "everparse:usenix-sec2019", title: "EverParse: Verified Secure Zero-Copy Parsers for Authenticated Message Formats", venue: "USENIX Security 2019", year: 2019, book: "USENIX Security Symposium", authors: "Tahina Ramananandro, Antoine Delignat-Lavaud, Cédric Fournet, Nikhil Swamy, Tej Chajed, Nadim Kobeissi, and Jonathan Protzenko", pdf: "/papers/everparse:usenix-sec2019.pdf", code: "https://github.com/project-everest/everparse" },
  { key: "argosy:pldi2019", title: "Argosy: Verifying Layered Storage Systems with Recovery Refinement", venue: "PLDI 2019", year: 2019, book: "SIGPLAN Conference on Programming Language Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/argosy:pldi2019.pdf", code: "https://github.com/mit-pdos/argosy", slides: "/papers/argosy:pldi2019-slides.pdf" },
  { key: "cspec:osdi2018", title: "Verifying concurrent software using movers in CSPEC", venue: "OSDI 2018", year: 2018, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, M. Frans Kaashoek, Butler Lampson, and Nickolai Zeldovich", pdf: "/papers/cspec:osdi2018.pdf", code: "https://github.com/mit-pdos/cspec", slides: "/papers/cspec:osdi2018-slides.pdf" },
  { key: "disksec:osdi2018", title: "Proving confidentiality in a file system using DiskSec", venue: "OSDI 2018", year: 2018, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Atalay İleri, Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/disksec:osdi2018.pdf" },
  { key: "dfscq:sosp2017", title: "Verifying a high-performance crash-safe file system using a tree specification", venue: "SOSP 2017", year: 2017, book: "ACM Symposium on Operating Systems Principles", authors: "Haogang Chen, Tej Chajed, Alex Konradi, Stephanie Wang, Atalay İleri, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/dfscq:sosp2017.pdf", code: "https://github.com/mit-pdos/fscq", slides: "/papers/dfscq:sosp2017-slides.pdf" },
  { key: "cfscq:sosp2017-src", title: "Extending a verified file system with concurrency", venue: "SOSP 2017 SRC", year: 2017, book: "Student Research Competition at ACM Symposium on Operating Systems Principles", authors: "Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/cfscq:sosp2017-src.pdf", slides: "/papers/cfscq:sosp2017-src-slides.pdf" },
  { key: "fscq:cacm2017", title: "Certifying a file system using Crash Hoare Logic: Correctness in the presence of crashes", venue: "CACM 2017", year: 2017, book: "Communications of the ACM", authors: "Tej Chajed, Haogang Chen, Adam Chlipala, M. Frans Kaashoek, Nickolai Zeldovich, and Daniel Ziegler", pdf: "/papers/fscq:cacm2017.pdf", code: "https://github.com/mit-pdos/fscq", journal: true },
  { key: "fscq:sosp2015", title: "Using Crash Hoare Logic for certifying the FSCQ file system", venue: "SOSP 2015", year: 2015, book: "ACM Symposium on Operating Systems Principles", authors: "Haogang Chen, Daniel Ziegler, Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/fscq:sosp2015.pdf", code: "https://github.com/mit-pdos/fscq" },
  { key: "amber:hotos2015", title: "Amber: Decoupling user data from web applications", venue: "HotOS 2015", year: 2015, book: "Workshop on Hot Topics in Operating Systems", authors: "Tej Chajed, Jon Gjengset, Jelle van den Hooff, M. Frans Kaashoek, James Mickens, Robert Morris, and Nickolai Zeldovich", pdf: "/papers/amber:hotos2015.pdf" }
];

export const selectedKeys = ["verus:osdi2024", "anvil:osdi2024", "dbsp:vldb2023", "perennial:sosp2019"];

export function publicationItem(paper) {
  const item = document.createElement("li");
  item.className = "publication";
  item.innerHTML = `
    <a class="publication-title" href="${paper.pdf}">${paper.title}</a>
    <span class="publication-authors">${paper.authors.replace("Tej Chajed", "<em>Tej Chajed</em>")}</span>
    <span class="publication-meta">
      <span class="venue">${paper.venue}</span>
      <a href="${paper.pdf}">PDF</a>
      ${paper.code ? `<a href="${paper.code}">CODE</a>` : ""}
      ${paper.slides ? `<a href="${paper.slides}">SLIDES</a>` : ""}
      <button class="text-button" type="button" data-bibtex="${paper.key}">BIBTEX</button>
    </span>`;
  return item;
}

export function renderPublications(list, target) {
  target.replaceChildren(...list.map(publicationItem));
}

export function bibtexFor(paper) {
  const authors = paper.authors.replace(/, and | and /g, " and ").replace(/, /g, " and ");
  if (paper.thesis) return `@phdthesis{${paper.key},\n  author = {Tej Chajed},\n  title = {${paper.title}},\n  school = {Massachusetts Institute of Technology},\n  year = {${paper.year}},\n  url = {https://www.chajed.io${paper.pdf}},\n}`;
  const type = paper.journal ? "article" : "inproceedings";
  const container = paper.journal ? "journal" : "booktitle";
  return `@${type}{${paper.key},\n  author = {${authors}},\n  title = {${paper.title}},\n  ${container} = {${paper.book}},\n  year = {${paper.year}},\n  url = {https://www.chajed.io${paper.pdf}},\n}`;
}

export function initializeBibtexDialog() {
  const dialog = document.querySelector("#bibtex-dialog");
  const title = document.querySelector("#bibtex-title");
  const code = document.querySelector("#bibtex-code");
  const copyButton = document.querySelector("#copy-bibtex");
  if (!dialog || !title || !code || !copyButton) return;

  document.addEventListener("click", (event) => {
    const button = event.target.closest("[data-bibtex]");
    if (!button) return;
    const paper = papers.find(({ key }) => key === button.dataset.bibtex);
    if (!paper) return;
    title.textContent = `BibTeX — ${paper.key}`;
    code.textContent = bibtexFor(paper);
    copyButton.textContent = "Copy BibTeX";
    dialog.showModal();
  });

  document.querySelector("#close-bibtex").addEventListener("click", () => dialog.close());
  copyButton.addEventListener("click", async () => {
    try {
      await navigator.clipboard.writeText(code.textContent);
      copyButton.textContent = "Copied ✓";
      window.setTimeout(() => { copyButton.textContent = "Copy BibTeX"; }, 1400);
    } catch {
      copyButton.textContent = "Copy failed";
    }
  });
}

export function downloadAllBibtex() {
  const contents = `${papers.map(bibtexFor).join("\n\n")}\n`;
  const url = URL.createObjectURL(new Blob([contents], { type: "application/x-bibtex;charset=utf-8" }));
  const link = document.createElement("a");
  link.href = url;
  link.download = "tej-chajed-publications.bib";
  link.click();
  window.setTimeout(() => URL.revokeObjectURL(url), 0);
}
