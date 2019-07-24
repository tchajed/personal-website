# Personal website

Sources for <https://www.chajed.io>.

This website is built using Racket, using `#lang at-exp` for much of the text.

The source is `index.rkt`, a Racket program that emits `index.html` when run. The main complexity is producing the publications list, which is described in a (very small) DSL in `pubs.rkt`.
