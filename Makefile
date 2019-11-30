all: docs/assets/main.css docs/index.html

docs/assets/main.css: styles/main.scss
	sassc $< $@

docs/index.html: index.rkt pubs.rkt
	racket $< > $@

serve:
	http-server docs -a localhost -p 6061 -o
