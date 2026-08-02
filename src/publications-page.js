import { downloadAllBibtex, initializeBibtexDialog, papers, renderPublications } from "./publications.js";

const list = document.querySelector(".all-publications");
const search = document.querySelector("#paper-search");
const resultCount = document.querySelector(".result-count");

function filterPapers() {
  const query = search.value.trim().toLocaleLowerCase();
  const results = query
    ? papers.filter((paper) => `${paper.title} ${paper.authors} ${paper.venue} ${paper.year}`.toLocaleLowerCase().includes(query))
    : papers;
  renderPublications(results, list);
  resultCount.textContent = results.length === papers.length
    ? `${papers.length} papers`
    : `${results.length} of ${papers.length} papers`;
}

search.addEventListener("input", filterPapers);
document.querySelector("#download-bibtex").addEventListener("click", downloadAllBibtex);
filterPapers();
initializeBibtexDialog();
