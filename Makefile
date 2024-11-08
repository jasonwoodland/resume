.PHONY: all build clean
.DEFAULT_GOAL: all

all: build

build:
	@docker build -t jasonwoodland/resume .
	@docker run --rm -i -v "${PWD}":/data jasonwoodland/resume pdflatex resume.tex

clean:
	@rm -f *.{aux,log,out}
