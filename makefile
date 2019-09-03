all: pdf

pdf: prepare
	@echo "Creating pdf output ..."
	@pwd
	@pandoc --latex-engine=xelatex fr/introduction.md fr/principes-de-base.md fr/message.md fr/requête.md fr/nomenclature.md fr/protocole.md fr/exploitation.md --output api-guidelines.pdf

prepare:
	@echo "Preparing ..."
