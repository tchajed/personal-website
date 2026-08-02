import { initializeBibtexDialog, papers, renderPublications, selectedKeys } from "./publications.js";

const selectedPapers = selectedKeys.map((key) => papers.find((paper) => paper.key === key));
renderPublications(selectedPapers, document.querySelector("#selected-publications"));
initializeBibtexDialog();
