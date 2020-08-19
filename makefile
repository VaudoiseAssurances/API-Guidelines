all: pdf-fr pdf-en

pdf-fr: prepare
	@echo "Creating french pdf output ..."
	@pwd
	@pandoc --latex-engine=xelatex fr/introduction.md fr/principes-de-base.md fr/message.md fr/requête.md fr/nomenclature.md fr/protocole.md fr/exploitation.md --output api-guidelines-fr.pdf

pdf-en: prepare
	@echo "Creating english pdf output ..."
	@pwd
	@pandoc --latex-engine=xelatex en/introduction.md en/basic-principles.md en/message.md en/request.md en/nomenclature.md en/protocol.md en/operations.md --output api-guidelines-en.pdf

prepare:
	@echo "Preparing ..."
