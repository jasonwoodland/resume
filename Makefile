.PHONY: all clean

.DEFAULT_GOAL: all

all: build resume

build: build.stamp

build.stamp:
	@docker image inspect jasonwoodland/resume > /dev/null 2>&1 || \
	{ \
		echo "Building Docker image jasonwoodland/resume..."; \
		docker build -t jasonwoodland/resume .; \
	}
	@touch build.stamp

resume: build
	@docker run --rm -i -v "${PWD}":/data jasonwoodland/resume pdflatex resume.tex

clean:
	@rm -f *.{aux,log,out,pdf} build.stamp
