LABNAME=toi_lab1
THEME=white

all: $(LABNAME).html $(LABNAME).pdf $(LABNAME).doc.html

# https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides
%.html: %.md
	pandoc -f markdown -t revealjs -s -o $@ $^ -V css=style.css  -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/ -V theme=${THEME}
	cp $@ style.css pinOut-R32-compressor.png toi_zapojeni.png ds18n20.png  ~/mnt/kazi-www/toi/
	
%.pdf: %.md
	pandoc -f markdown --toc -t latex -s -o $@ $^

%.doc.html: %.md
	pandoc -f markdown --toc -t html  -c github.css -s -o $@ $^	
	cp $@ github.css  ~/mnt/kazi-www/toi/


#doc.html: demo.md
#	pandoc -t html -s -o $@ $^

#doc.pdf: demo.md
#	pandoc -t pdf -s -o $@ $^
