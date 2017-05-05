# vim:filetype=perl
#
# Exemplo de arquivo latexmkrc para compilação de um documento
# LaTeX através do latexmk e utilizando a classe pucrs-ppgcc.cls.
#
# por Ricardo Piccoli <rfbpiccoli at gmail dot com>.
@default_files = ( "exemplo" );

push @generated_exts, "loa";
push @generated_exts, "lob";
push @generated_exts, "los";
push @generated_exts, "lov";

$pdf_mode   = 1;
$pdflatex   = "pdflatex -shell-escape %O %S && ./sort.sh %S";
$sleep_time = 1;
$bibtex_use = 2;

#$force_mode = 1;
#$preview_continuous_mode = 1;
