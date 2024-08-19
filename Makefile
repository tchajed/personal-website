all: docs/assets/main.css docs/index.html

docs/assets/main.css: styles/main.scss
	sassc $< $@

docs/index.html: index.rkt pubs.rkt
	racket $< > $@

serve:
	python3 -m http.server -d docs --bind localhost 6061
