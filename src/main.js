import rough from "roughjs/bundled/rough.esm.js";
import "./style.css";

const papers = [
  { key: "basilisk2025", title: "Basilisk: Using Provenance Invariants to Automate Proofs of Undecidable Protocols", venue: "OSDI 2025", year: 2025, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tony Nuda Zhang, Keshav Singh, Tej Chajed, Manos Kapritsos, and Bryan Parno", pdf: "/papers/basilisk:osdi2025.pdf" },
  { key: "verus2024", title: "Verus: A Practical Foundation for Systems Verification", venue: "SOSP 2024", year: 2024, book: "ACM Symposium on Operating Systems Principles", authors: "Andrea Lattuada, Travis Hance, Jay Bosamiya, Matthias Brun, Chanhee Cho, Hayley LeBlanc, Pranav Srinivasan, Reto Achermann, Tej Chajed, Chris Hawblitzel, Jon Howell, Jacob R. Lorch, Oded Padon, and Bryan Parno", pdf: "/papers/verus:sosp2024.pdf" },
  { key: "shadowfs2024", title: "Shadow Filesystems: Recovering from Filesystem Runtime Errors via Robust Alternative Execution", venue: "HotStorage 2024", year: 2024, book: "ACM Workshop on Hot Topics in Storage and File Systems", authors: "Jing Liu, Xiangpeng Hao, Andrea Arpaci-Dusseau, Remzi Arpaci-Dusseau, and Tej Chajed", pdf: "/papers/shadow-fs:hotstorage2024.pdf" },
  { key: "absintfo2024", title: "Efficient Implementation of an Abstract Domain of Quantified First-Order Formulas", venue: "CAV 2024", year: 2024, book: "Computer Aided Verification", authors: "Eden Frenkel, Tej Chajed, Oded Padon, and Sharon Shoham", pdf: "/papers/absint-fo:cav2024.pdf" },
  { key: "anvil2024", title: "Anvil: Verifying Liveness of Cluster Management Controllers", venue: "OSDI 2024", year: 2024, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Xudong Sun, Wenjie Ma, Jiawei Tyler Gu, Zicheng Ma, Tej Chajed, Jon Howell, Andrea Lattuada, Oded Padon, Lalith Suresh, Adriana Szekeres, and Tianyin Xu", pdf: "/papers/anvil:osdi2024.pdf" },
  { key: "kondo2024", title: "Inductive Invariants That Spark Joy: Using Invariant Taxonomies to Streamline Distributed Protocol Proofs", venue: "OSDI 2024", year: 2024, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tony Nuda Zhang, Travis Hance, Manos Kapritsos, Tej Chajed, and Bryan Parno", pdf: "/papers/kondo:osdi2024.pdf" },
  { key: "beyondisolation2023", title: "Beyond isolation: OS verification as a foundation for correct applications", venue: "HotOS 2023", year: 2023, book: "Workshop on Hot Topics in Operating Systems", authors: "Matthias Brun, Reto Achermann, Tej Chajed, Jon Howell, Gerd Zellweger, and Andrea Lattuada", pdf: "/papers/beyond-isolation:hotos2023.pdf" },
  { key: "dbsp2023", title: "DBSP: Automatic Incremental View Maintenance for Rich Query Languages", venue: "VLDB 2023", year: 2023, book: "Very Large Databases Conference", authors: "Mihai Budiu, Tej Chajed, Frank McSherry, Leonid Ryzhyk, and Val Tannen", pdf: "/papers/dbsp:vldb2023.pdf" },
  { key: "chajed2022thesis", title: "Verifying a concurrent, crash-safe file system with sequential reasoning", venue: "PhD Thesis, MIT 2022", year: 2022, book: "", authors: "Tej Chajed", pdf: "/papers/tchajed-thesis.pdf", slides: "/papers/tchajed-thesis-slides.pdf", thesis: true },
  { key: "daisynfs2022", title: "Verifying the DaisyNFS concurrent and crash-safe file system with sequential reasoning", venue: "OSDI 2022", year: 2022, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, Mark Theng, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/daisy-nfs:osdi2022.pdf", slides: "/papers/daisy-nfs:osdi2022-slides.pdf" },
  { key: "gojournal2021", title: "GoJournal: a verified, concurrent, crash-safe journaling system", venue: "OSDI 2021", year: 2021, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, Mark Theng, Ralf Jung, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/gojournal:osdi2021.pdf", slides: "/papers/gojournal:osdi2021-slides.pdf" },
  { key: "coqrecordupdate2021", title: "Record Updates in Coq", venue: "CoqPL 2021", year: 2021, book: "International Workshop on Coq for Programming Languages", authors: "Tej Chajed", pdf: "/papers/coq-record-update:coqpl2021.pdf", slides: "/papers/coq-record-update:coqpl2021-slides.pdf" },
  { key: "goose2020", title: "Verifying concurrent Go code in Coq with Goose", venue: "CoqPL 2020", year: 2020, book: "International Workshop on Coq for Programming Languages", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/goose:coqpl2020.pdf", slides: "/papers/goose:coqpl2020-slides.pdf" },
  { key: "perennial2019", title: "Verifying concurrent, crash-safe systems with Perennial", venue: "SOSP 2019", year: 2019, book: "ACM Symposium on Operating Systems Principles", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/perennial:sosp2019.pdf", slides: "/papers/perennial:sosp2019-slides.pdf" },
  { key: "everparse2019", title: "EverParse: Verified Secure Zero-Copy Parsers for Authenticated Message Formats", venue: "USENIX Security 2019", year: 2019, book: "USENIX Security Symposium", authors: "Tahina Ramananandro, Antoine Delignat-Lavaud, Cédric Fournet, Nikhil Swamy, Tej Chajed, Nadim Kobeissi, and Jonathan Protzenko", pdf: "/papers/everparse:usenix-sec2019.pdf" },
  { key: "argosy2019", title: "Argosy: Verifying Layered Storage Systems with Recovery Refinement", venue: "PLDI 2019", year: 2019, book: "SIGPLAN Conference on Programming Language Design and Implementation", authors: "Tej Chajed, Joseph Tassarotti, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/argosy:pldi2019.pdf", slides: "/papers/argosy:pldi2019-slides.pdf" },
  { key: "cspec2018", title: "Verifying concurrent software using movers in CSPEC", venue: "OSDI 2018", year: 2018, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Tej Chajed, M. Frans Kaashoek, Butler Lampson, and Nickolai Zeldovich", pdf: "/papers/cspec:osdi2018.pdf", slides: "/papers/cspec:osdi2018-slides.pdf" },
  { key: "disksec2018", title: "Proving confidentiality in a file system using DiskSec", venue: "OSDI 2018", year: 2018, book: "USENIX Symposium on Operating Systems Design and Implementation", authors: "Atalay İleri, Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/disksec:osdi2018.pdf" },
  { key: "dfscq2017", title: "Verifying a high-performance crash-safe file system using a tree specification", venue: "SOSP 2017", year: 2017, book: "ACM Symposium on Operating Systems Principles", authors: "Haogang Chen, Tej Chajed, Alex Konradi, Stephanie Wang, Atalay İleri, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/dfscq:sosp2017.pdf", slides: "/papers/dfscq:sosp2017-slides.pdf" },
  { key: "cfscq2017", title: "Extending a verified file system with concurrency", venue: "SOSP 2017 SRC", year: 2017, book: "Student Research Competition at ACM Symposium on Operating Systems Principles", authors: "Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/cfscq:sosp2017-src.pdf", slides: "/papers/cfscq:sosp2017-src-slides.pdf" },
  { key: "fscq2017cacm", title: "Certifying a file system using Crash Hoare Logic: Correctness in the presence of crashes", venue: "CACM 2017", year: 2017, book: "Communications of the ACM", authors: "Tej Chajed, Haogang Chen, Adam Chlipala, M. Frans Kaashoek, Nickolai Zeldovich, and Daniel Ziegler", pdf: "/papers/fscq:cacm2017.pdf", journal: true },
  { key: "fscq2015", title: "Using Crash Hoare Logic for certifying the FSCQ file system", venue: "SOSP 2015", year: 2015, book: "ACM Symposium on Operating Systems Principles", authors: "Haogang Chen, Daniel Ziegler, Tej Chajed, Adam Chlipala, M. Frans Kaashoek, and Nickolai Zeldovich", pdf: "/papers/fscq:sosp2015.pdf" },
  { key: "amber2015", title: "Amber: Decoupling user data from web applications", venue: "HotOS 2015", year: 2015, book: "Workshop on Hot Topics in Operating Systems", authors: "Tej Chajed, Jon Gjengset, Jelle van den Hooff, M. Frans Kaashoek, James Mickens, Robert Morris, and Nickolai Zeldovich", pdf: "/papers/amber:hotos2015.pdf" }
];

const selectedKeys = ["verus2024", "anvil2024", "daisynfs2022", "perennial2019"];
const selectedList = document.querySelector("#selected-publications");
const allList = document.querySelector(".all-publications");
const dialog = document.querySelector("#papers-dialog");
const search = document.querySelector("#paper-search");
const resultCount = document.querySelector(".result-count");

function abbreviatedAuthors(authors) {
  return authors.split(/, and |, | and /).map((name) => {
    const family = name.trim().split(" ").at(-1);
    return name.trim() === "Tej Chajed" ? `<em>${family}</em>` : family;
  }).join(", ");
}

function publicationItem(p, abbreviated = false) {
  const item = document.createElement("li");
  item.className = "publication";
  item.innerHTML = `
    <a class="publication-title" href="${p.pdf}">${p.title}</a>
    <span class="publication-authors">${abbreviated ? abbreviatedAuthors(p.authors) : p.authors.replace("Tej Chajed", "<em>Tej Chajed</em>")}</span>
    <span class="publication-meta">
      <span class="venue">${p.venue}</span>
      <a href="${p.pdf}">PDF</a>
      ${p.slides ? `<a href="${p.slides}">SLIDES</a>` : ""}
      <button class="text-button" type="button" data-bibtex="${p.key}">BIBTEX</button>
    </span>`;
  return item;
}

function render(list, target, abbreviated = false) {
  target.replaceChildren(...list.map((paper) => publicationItem(paper, abbreviated)));
}

function bibtexFor(p) {
  const authors = p.authors.replace(/, and | and /g, " and ").replace(/, /g, " and ");
  if (p.thesis) return `@phdthesis{${p.key},\n  author = {Tej Chajed},\n  title = {${p.title}},\n  school = {Massachusetts Institute of Technology},\n  year = {${p.year}},\n  url = {https://www.chajed.io${p.pdf}},\n}`;
  const type = p.journal ? "article" : "inproceedings";
  const container = p.journal ? "journal" : "booktitle";
  return `@${type}{${p.key},\n  author = {${authors}},\n  title = {${p.title}},\n  ${container} = {${p.book}},\n  year = {${p.year}},\n  url = {https://www.chajed.io${p.pdf}},\n}`;
}

async function copyBibtex(button) {
  const paper = papers.find(({ key }) => key === button.dataset.bibtex);
  if (!paper) return;
  try { await navigator.clipboard.writeText(bibtexFor(paper)); } catch { return; }
  button.textContent = "COPIED ✓";
  window.setTimeout(() => { button.textContent = "BIBTEX"; }, 1400);
}

document.addEventListener("click", (event) => {
  const button = event.target.closest("[data-bibtex]");
  if (button) copyBibtex(button);
});

function filterPapers() {
  const query = search.value.trim().toLocaleLowerCase();
  const results = query ? papers.filter((p) => `${p.title} ${p.authors} ${p.venue} ${p.year}`.toLocaleLowerCase().includes(query)) : papers;
  render(results, allList);
  resultCount.textContent = results.length === papers.length ? `${papers.length} papers` : `${results.length} of ${papers.length} papers`;
}

document.querySelector("#open-papers").addEventListener("click", () => { dialog.showModal(); filterPapers(); window.setTimeout(() => search.focus(), 0); });
document.querySelector("#close-papers").addEventListener("click", () => dialog.close());
dialog.addEventListener("close", () => { search.value = ""; });
search.addEventListener("input", filterPapers);

function drawAnnotations() {
  document.querySelectorAll("[data-annot]").forEach((element) => {
    element.querySelector("svg")?.remove();
    const width = element.offsetWidth;
    const height = element.offsetHeight;
    if (!width || !height) return;
    const padding = 10;
    const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    svg.setAttribute("width", width + padding * 2);
    svg.setAttribute("height", height + padding * 2);
    Object.assign(svg.style, { position: "absolute", left: `${-padding}px`, top: `${-padding}px`, pointerEvents: "none", overflow: "visible" });
    const line = rough.svg(svg).line(padding - 2, height + padding - 1, width + padding + 2, height + padding - 1, { stroke: "#7b2f2a", strokeWidth: 1.5, roughness: 1.7, bowing: 2.2 });
    svg.append(line);
    element.append(svg);
  });
}

render(selectedKeys.map((key) => papers.find((p) => p.key === key)), selectedList, true);
drawAnnotations();
let resizeTimer;
window.addEventListener("resize", () => { window.clearTimeout(resizeTimer); resizeTimer = window.setTimeout(drawAnnotations, 150); });
