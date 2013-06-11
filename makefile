# Exemplo de arquivo Makefile para construção de um documento
# LaTeX, utilizando a classe pucrs-ppgcc.cls.
# por Ricardo Piccoli <rfbpiccoli at gmail dot com>
#
# !!ATENÇÃO!! O uso incorreto deste script pode causar a perda ou
# sobrescrita de arquivos no diretório onde estiver sendo
# utilizado. Examine este arquivo com cuidado e, em caso de
# dúvidas, NÃO o utilize para compilar o seu documento. Não me
# responsabilizo pela perda acidental de arquivos!

# Coloque em TARGET o nome (sem a extensão .tex) do seu documento
# (apenas o documento principal). Como alternativa, coloque na
# linha de comando:
# make TARGET=exemplo
TARGET=exemplo
PDFDIR=pdf

RM=rm -f
#RM=rm -i # para evitar remoções indesejadas de arquivos.

# Substitua por 'pdflatex' caso deseje incluir figuras .png ou
# .jpg no seu documento.
LATEX=latex
#LATEX=pdflatex
BIBTEX=bibtex
SORT=./sort.sh

# Verifique se sua instalação do LaTeX e Ghostscript
# possuem estes comandos:
PDFOPT=pdfopt
ifeq ($(LATEX),latex)
DVIPS=dvips
DVIPSOPTS=-P pdf -t a4 -Pdownload35
PS2PDF=ps2pdf -dPDFSETTINGS=/prepress
endif

all: $(TARGET).pdf
	mkdir -p $(PDFDIR)
	$(PDFOPT) $< $(PDFDIR)/$<

ifeq ($(LATEX),pdflatex)
$(TARGET).pdf: $(TARGET).tex
else
$(TARGET).pdf: $(TARGET).ps
	$(PS2PDF) $<

$(TARGET).ps: $(TARGET).dvi
	$(DVIPS) $(DVIPSOPTS) -o $@ $<

$(TARGET).dvi: $(TARGET).tex
endif
	$(LATEX) $<
	$(BIBTEX) $(TARGET)
	$(LATEX) $<
	# comente a próxima linha se estiver em um ambiente Windows,
	# sem o Cygwin ou ambientes similares.
	$(SORT) $(TARGET)
	$(LATEX) $<

# Cuidado! 'make clean' irá apagar quaisquer arquivos .pdf no
# diretório atual. Retire a entrada '*.pdf' abaixo se não desejar
# este comportamento.
clean:
	$(RM) *.aux *.log *.bbl *.blg *.out *.toc *.loa *.lob *.lov *.lof *.los *.lot *.dvi *.ps *.pdf
# A sintaxe abaixo aparentemente só funciona no bash:
#	$(RM) *.{aux,log,bbl,blg,out,toc,loa,lob,lov,lof,los,lot,dvi,ps,pdf}
