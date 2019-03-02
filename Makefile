all: docs/assets/main.css docs/index.html

docs/assets/main.css: styles/main.scss
	sassc $< $@

docs/index.html: index.scrbl
	racket $< > $@
