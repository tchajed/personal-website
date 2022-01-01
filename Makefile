all: docs/assets/main.css docs/index.html

HTML_FILES := $(shell find docs -name "*.html")

docs/assets/main.css: $(HTML_FILES) styles/input.css
	npx tailwindcss -i ./styles/input.css -o $@

docs/index.html: index.rkt pubs.rkt
	racket $< > $@

serve:
	http-server docs -a localhost -p 6061 -o
