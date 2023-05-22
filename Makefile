.PHONY: default

default:
	-mkdir -p .latexmk/figures/tikzexternal
	latexmk -auxdir=.latexmk -outdir=.latexmk -pdf -halt-on-error -interaction=nonstopmode -shell-escape main.tex
	cp .latexmk/main.pdf .

clean:
	-rm -rf .latexmk
	-rm -rf figures/tikzexternal/*
