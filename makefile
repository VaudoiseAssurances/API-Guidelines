all: pdf

pdf: prepare
	@echo "Creating pdf output ..."
	@pwd
	@pandoc --latex-engine=xelatex fr/*.md --output api-guidelines.pdf

prepare:
	@echo "Preparing ..."
