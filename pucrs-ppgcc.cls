%% Copyright (C) 2012 Ricardo Piccoli <rfbpiccoli at gmail dot com>
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program; if not, write to the Free Software
%% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
%%
%----------------------------------------------------------------------------------
% Classe LaTeX para monografias, teses e dissertações -- PPGCC/PUCRS (modelo 2009)
%
% Para instruções de como utilizar a classe, veja o arquivo exemplo.tex. Para
% facilitar, recomendo utilizar o mesmo arquivo como template inicial para o seu
% trabalho.
%
% ATENÇÃO! O modelo implementado por esta classe NÃO é oficial do PPGCC e não
% implementa todas as normas de formatação propostas pelo PPGCC, ou ainda, pela
% Biblioteca Central da PUCRS. Desta forma, não é possível garantir que sua tese
% ou dissertação será homologada apenas pelo uso esta classe. Fique atento às
% normas documentadas neste link:
%
% http://www.inf.pucrs.br/alunos/PPGCC/ModeloTeseDiMono/padrao_dissertacoes_teses_ataCC21_2010_v3.pdf
%
% Limitações:
%   - funciona apenas em dois idiomas: português e inglês
%   - formata PEP's, monografias, teses e propostas de tese
%   - a ordenação automática da lista de siglas/abreviaturas ainda
%   requer um utilitário externo (sort.sh). Porém, para
%   simplificar a classe é desejável uma implementação interna
%   deste procedimento.
%
% Desejável (para futuras versões):
%   - Monografia em outros idiomas além de português e inglês.
%   - O código dependente de idioma atualmente é acoplado à
%   classe, sem uma abstração bem definida. Como fazer melhor?
%   - Documentar a classe com o pacote 'doc' e organizar com o
%   DocStrip (texdoc doc; texdoc docstrip).
%   - Macro interna do TeX para realizar a ordenação lexicográfica
%   das listas de siglas e abreviaturas. Ver 'Sorting Within TeX',
%   de Kees Van der Laan, TUGboat, volume 14 (1993), No. 3
%   (http://www.ctan.org/pkg/laansort).
%
% Obs.: Alguns trechos de código (i. e., "macros") foram obtidos e modificados a
% partir da classe base 'report.cls' do LaTeX e do kernel 'latex.ltx',
% distribuídos sob a licença LPPL (veja http://www.latex-project.org/lppl.txt).
% Tais mudanças estão devidamente documentadas e justificadas neste arquivo.
%----------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pucrs-ppgcc}[2012/04/26 ^^J
------------------------------------------------------------^^J
Classe para monografias, teses e dissertacoes -- PPGCC/PUCRS^^J
^^J
Para resolucao de problemas ou sugestoes, entre em contato pelo^^J
e-mail <rfbpiccoli at gmail dot com>^^J
------------------------------------------------------------]

\def\PP@english{english}
\def\PP@brazil{brazil}
\let\PP@language\PP@brazil
\def\PP@erro{\ClassError{Opção '\CurrentOption' não permitida para este formato!}}
\DeclareOption{letterpaper}{\PP@erro}
\DeclareOption{legalpaper}{\PP@erro}
\DeclareOption{executivepaper}{\PP@erro}
\DeclareOption{a5paper}{\PP@erro}
\DeclareOption{b5paper}{\PP@erro}
\DeclareOption{landscape}{\PP@erro}
\DeclareOption{twocolumn}{\PP@erro}
\DeclareOption{notitlepage}{\PP@erro}
\DeclareOption{10pt}{\PP@erro}
\DeclareOption{11pt}{\PP@erro}
\DeclareOption{english}{\global\let\PP@language\PP@english}
\DeclareOption{portuguese}{\global\let\PP@language\PP@brazil}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
%\ExecuteOptions{12pt,onecolumn,twoside,titlepage,a4paper,openright,final}
%\LoadClass[12pt,onecolumn,twoside,titlepage,a4paper,openright,final]{report}[2007/10/19]
\LoadClass[12pt,onecolumn,titlepage,a4paper,openright,final]{report}[2007/10/19]

\RequirePackage[round,sectionbib,numbers]{natbib}
\RequirePackage[T1]{fontenc}[2005/09/27]
\RequirePackage[utf8]{inputenc}[2008/03/30]
\RequirePackage[english,brazil]{babel}[2008/07/06]
\RequirePackage[a4paper]{geometry}[2010/09/12]
\RequirePackage{textcomp}[2005/09/27]
\RequirePackage{helvet}[2005/04/12]
\RequirePackage[helvet]{sfmath}[2007/08/27]
%\RequirePackage{lmodern}[2009/10/30]
%\RequirePackage[lm]{sfmath}[2007/08/27]
\RequirePackage{indentfirst}[1995/11/23]
\RequirePackage{setspace}[2000/12/01]
\RequirePackage{textcase}[2004/10/07]
%\RequirePackage{graphicx}[1999/02/16]
\RequirePackage{float}[2001/11/08]
\RequirePackage{amsmath}[2000/07/18]
\RequirePackage{amssymb}[2009/06/22]
\RequirePackage{amsfonts}[2009/06/22]
\RequirePackage{url}
\RequirePackage[table]{xcolor}[2007/01/21]
\RequirePackage{array}[2008/09/09]
\RequirePackage{longtable}

%\RequirePackage[ruled]{algorithm}[2009/08/24]
%\RequirePackage[algo2e]{algorithm2e}[2009/08/24]
%\RequirePackage{algorithmic}[2009/08/24]
%\RequirePackage{subfigure}[2002/03/15]
%\RequirePackage{multirow}

%----------------------------------------------------------------------------------
% Para usuários do LyX.
%----------------------------------------------------------------------------------
\newcommand{\LyXTType}[1]{\lowercase{\edef\t{\expandafter\csname#1\endcsname}}\tipotrabalho{\t}}
\newcommand{\LyXDegree}[1]{\lowercase{\edef\g{\expandafter\csname#1\endcsname}}\grau{\g}}

%----------------------------------------------------------------------------------
% Seleciona o idioma o mais cedo possível.
%
% TODO Necessário?
%----------------------------------------------------------------------------------
%\expandafter\selectlanguage\expandafter{\PP@language}

%----------------------------------------------------------------------------------
% Redefine o tamanho da fonte \large para exatamente 14pt, e 18pt de
% espaçamento entre baselines.
%
% TODO Necessário?
%----------------------------------------------------------------------------------
% \renewcommand\large{\@setfontsize\large{14}{18}}

%----------------------------------------------------------------------------------
% Redefinindo \eqref para que as referências para equações
% funcionem normalmente dentro de \MakeTextUppercase (usado no
% sumário e títulos de capítulos e seções).
%----------------------------------------------------------------------------------
\let\PP@eqref\eqref
\renewcommand{\eqref}[1]{\protect\NoCaseChange{\PP@eqref{#1}}}

%----------------------------------------------------------------------------------
% Faz um retângulo em volta da caixa #1 com \PP@boxsep de margem, para
% depuração. Evitei o \framebox{} pois desconheço qualquer possível
% efeito colateral do mesmo.
%----------------------------------------------------------------------------------
\newdimen\PP@boxsep
\PP@boxsep0pt
\long\def\PP@boxit#1{%
    \vbox{%
        \hrule
        \hbox{%
            \vrule
            \kern\PP@boxsep
            \vbox{%
                \kern\PP@boxsep
                #1\relax
                \kern\PP@boxsep
            }%
            \kern
            \PP@boxsep
            \vrule
       }%
       \hrule
   }%
}
%----------------------------------------------------------------------------------
% Preenche a caixa atual com uma linha horizontal.
%----------------------------------------------------------------------------------
\def\PP@hrulefill{\leavevmode\leaders\hrule\hfill}

%----------------------------------------------------------------------------------
% Novos comandos e alocação de registradores (públicos e internos). Comandos
% internos começam com o prefixo PP@.
%----------------------------------------------------------------------------------
%\edef\PP@undef{n\~{a}o definido}
\edef\PP@undef{not defined}
\newcommand*{\monografia}{Monografia}
\let\PP@grau=\PP@undef
\let\PP@tipo=\monografia
\newcommand*{\tipotrabalho}[1]{\global\let\PP@tipo=#1
  \ifx#1\ptese\grau{\doutor}\else
  \ifx#1\tese\grau{\doutor}\else
  \ifx#1\dissertacao\grau{\mestre}\fi\fi\fi}
\newcommand*{\grau}[1]{\global\let\PP@grau=#1}
\edef\PP@orientador{\PP@undef}
\edef\PP@coorientador{\PP@undef}
\newcommand*{\orientador}[1]{\renewcommand*{\PP@orientador}{#1}}
\newcommand*{\coorientador}[1]{\renewcommand*{\PP@coorientador}{#1}}
\newcommand*{\PP@Cid}{Porto~Alegre}

% Definições dependentes de idioma.
%\addto\captionsbrazil{%
    \newcommand*{\PP@Uni}{Pontif\'{i}cia Universidade Cat\'{o}lica do Rio Grande do Sul}
    \newcommand*{\PP@Fac}{Escola Polit\'{e}cnica}
    \newcommand*{\PP@Dep}{Programa de P\'{o}s-Gradua\c{c}\~{a}o em Ci\^{e}ncia da Computa\c{c}\~{a}o}
    %\edef\PP@undef{n\~{a}o definido}
    \newcommand*{\tese}{Tese}
    \newcommand*{\pep}{Plano de estudo e pesquisa}
    \newcommand*{\ptese}{Proposta de tese}
    \newcommand*{\dissertacao}{Disserta\c{c}\~{a}o}
    \newcommand*{\doutor}{Doutor}
    \newcommand*{\mestre}{Mestre}
    \newcommand*{\bacharel}{Bacharel}
    \newcommand*{\PP@orientadorname}{Orientador}
    \newcommand*{\PP@descricao}{%
        \PP@tipo{} apresentad\ifx\PP@tipo\pep o\else a\fi{} como requisito parcial \`{a}
        obten\c{c}\~{a}o do grau de \PP@grau{} em Ci\^{e}ncia da
        Computa\c{c}\~{a}o na \PP@Uni{}.%
    }
    \newcommand*{\PP@fichaname}{Substitua esta p\'{a}gina pela Ficha Catalogr\'{a}fica}
    \newcommand*{\PP@termoname}{Substitua esta p\'{a}gina pelo Termo de Apresenta\c{c}\~{a}o}
    \newcommand*{\PP@dedicatorianame}{Dedicat\'{o}ria}
    \newcommand*{\PP@agradecimentosname}{Agradecimentos}
    \newcommand*{\PP@bibname}{Refer\^{e}ncias}
    \newcommand*{\PP@anexoname}{Anexo}
    % TODO Para usar os estilos bibliográficos de forma independente desta
    % classe, copie estas definições para o seu documento.
    \gdef\bbland{e}
    \gdef\bbletal{et~al.}
    \gdef\bbleditors{editores}
    \gdef\bbleditor{editor}
    \gdef\bbledby{editado por}
    \gdef\bbledn{ed.}
    \gdef\bblvol{vol.}
    \gdef\bblof{de}
    \gdef\bblno{n\raise1ex\hbox{\underbar{\scriptsize o}}}
    \gdef\bblno{n\raise1ex\hbox{\underbar{\scriptsize o}}}
    \gdef\bblin{in}
    \gdef\bblpp{pp.}
    \gdef\bblp{pp.}
    \gdef\bbleidpp{p}
    \gdef\bblchap{cap.}
    \gdef\bbltechrep{Relat\'{o}rio T\'{e}cnico}
    \gdef\bblmthesis{Disserta\c{c}\~{a}o de Mestrado}
    \gdef\bblphdthesis{Tese de Doutorado}
    \gdef\bblcaptured{Capturado em: }
    \gdef\bbljan{Jan}
    \gdef\bblfeb{Fev}
    \gdef\bblmar{Mar}
    \gdef\bblapr{Abr}
    \gdef\bblmay{Maio}
    \gdef\bbljun{Jun}
    \gdef\bbljul{Jul}
    \gdef\bblaug{Ago}
    \gdef\bblsep{Set}
    \gdef\bbloct{Out}
    \gdef\bblnov{Nov}
    \gdef\bbldec{Dez}
%}
\addto\captionsenglish{%
    \renewcommand*{\PP@Uni}{Pontifical Catholic University of Rio Grande do Sul}
    \renewcommand*{\PP@Fac}{School of Technology}
    \renewcommand*{\PP@Dep}{Computer Science Graduate Program}
    %\edef\PP@undef{not defined}
    \renewcommand*{\tese}{Dissertation}
    \renewcommand*{\pep}{Research plan}
    \renewcommand*{\ptese}{Dissertation proposal}
    \renewcommand*{\dissertacao}{Thesis}
    \renewcommand*{\monografia}{Thesis}
    \renewcommand*{\doutor}{Ph.\ D.\ }
    \renewcommand*{\mestre}{Master}
    \renewcommand*{\bacharel}{Bachelor}
    \renewcommand*{\PP@orientadorname}{Advisor}
    \renewcommand*{\PP@descricao}{%
        \PP@tipo{} submitted to the \PP@Uni{} in partial fulfillment of
        the requirements for the degree of \PP@grau{} in Computer
        Science.%
    }
    \renewcommand*{\PP@fichaname}{Replace this page with the Library Catalog Page}
    \renewcommand*{\PP@termoname}{Replace this page with the Committee Forms}
    \renewcommand*{\PP@dedicatorianame}{\null}
    \renewcommand*{\PP@agradecimentosname}{Acknowledgments}
    \renewcommand*{\PP@bibname}{References}
    \renewcommand*{\PP@anexoname}{Attachment}
    % TODO Para usar os estilos bibliográficos de forma independente desta
    % classe, copie estas definições para o seu documento.
    \gdef\bbland{and}
    \gdef\bbletal{et~al.}
    \gdef\bbleditors{editors}
    \gdef\bbleditor{editor}
    \gdef\bbledby{edited by}
    \gdef\bbledn{ed.}
    \gdef\bblvol{vol.}
    \gdef\bblof{of}
    \gdef\bblno{n\raise1ex\hbox{\underbar{\scriptsize o}}}
    \gdef\bblno{n\raise1ex\hbox{\underbar{\scriptsize o}}}
    \gdef\bblin{in}
    \gdef\bblpp{pp.}
    \gdef\bblp{pp.}
    \gdef\bbleidpp{p}
    \gdef\bblchap{chap.}
    \gdef\bbltechrep{Technical Report}
    \gdef\bblmthesis{Master's Thesis}
    \gdef\bblphdthesis{Ph.D. Thesis}
    \gdef\bblcaptured{Source: }
    \gdef\bbljan{Jan}
    \gdef\bblfeb{Feb}
    \gdef\bblmar{Mar}
    \gdef\bblapr{Apr}
    \gdef\bblmay{May}
    \gdef\bbljun{Jun}
    \gdef\bbljul{Jul}
    \gdef\bblaug{Aug}
    \gdef\bblsep{Sep}
    \gdef\bbloct{Oct}
    \gdef\bblnov{Nov}
    \gdef\bbldec{Dec}
}

%----------------------------------------------------------------------------------
% Redefinindo o comando interno do LaTeX para armazenar títulos,
% pois precisamos do título em dois idiomas.
%----------------------------------------------------------------------------------
\def\@titleen{\@latex@error{No \noexpand\title given}\@ehc}
\def\@titlept{\@latex@error{Nenhum \noexpand\title informado}\@ehc}
\let\@title=\@titleen
% #1: título em português
% #2: título em inglês
\def\title#1#2{\gdef\@titlept{#1}\gdef\@titleen{#2}%
\ifx\PP@language\PP@brazil \global\let\@title=\@titlept
\else \global\let\@title=\@titleen\fi}

%----------------------------------------------------------------------------------
% Formatação da capa.
%----------------------------------------------------------------------------------
\newbox\PP@tmpbox
\newdimen\PP@tmpdim
\renewcommand\maketitle{%
\begin{titlepage}%
    \renewcommand*{\baselinestretch}{1.0}%
    \hoffset=-1in
    \voffset=-1in
    \hsize=\paperwidth
    \vsize=\paperheight
    \textwidth=\paperwidth
    \textheight=\paperheight
    \evensidemargin0pt
    \oddsidemargin0pt
    \topmargin0pt
    \headheight0pt
    \headsep0pt
    \topskip0pt
    \footskip0pt
    \columnsep0pt
    \columnseprule0pt
    \columnwidth0pt
    \marginparpush0pt
    \marginparsep0pt
    \marginparwidth0pt
    \global\let\thanks\relax
    \global\let\date\relax
    \global\let\@thanks\@empty
    \global\let\@date\@empty
    \let\footnote\thanks
    \normalfont\normalsize
    \vbox to \vsize{%
        \boxmaxdepth=0pt
        \parindent0pt
        \parfillskip0pt
        \parskip0pt
        \leftskip0pt
        \rightskip0pt
        \lineskiplimit0pt
        \lineskip0pt
        \kern4ex\par
        %----------------------------------------------------------------------------------
        % Cabeçalho (universidade + faculdade + programa)
        %----------------------------------------------------------------------------------
        \setbox\PP@tmpbox=\vbox{%
            \leftskip0pt plus1fil
            \rightskip0pt plus1fil
            \hyphenpenalty 10000\relax
            \bfseries
            \noindent\MakeTextUppercase{\PP@Uni}\par
            \noindent\MakeTextUppercase{\PP@Fac}\par
            \noindent\MakeTextUppercase{\PP@Dep}\par
        }%
        \PP@tmpdim=9.5cm
        \advance\PP@tmpdim by-4ex
        \advance\PP@tmpdim by-\ht\PP@tmpbox
        \advance\PP@tmpdim by-\dp\PP@tmpbox
        \box\PP@tmpbox\par\nointerlineskip
        \kern\PP@tmpdim\par
        %----------------------------------------------------------------------------------
        % Retângulo central (título + autor)
        %----------------------------------------------------------------------------------
        \hbox{\kern5cm\vbox to 7.7cm{%
            \hsize=11.5cm
            \parskip6ex
            \parindent0pt
            \leftskip0pt plus1fil
            \rightskip0pt plus1fil
            \leavevmode\kern2.5em\vbox{%
                \advance\hsize by-5em
                \bfseries
                %\lineskip.25\baselineskip
                \baselineskip1.2\baselineskip
                \lineskip0pt
                \lineskiplimit0pt
                \noindent\hbox{}\par\nointerlineskip
                \noindent{\Large\expandafter\MakeTextUppercase\expandafter{\@title}}\par
                \noindent{\large\expandafter\MakeTextUppercase\expandafter{\@author}}\par\nointerlineskip
                \vfil\hbox{}%
            }\kern2.5em
        }}\par\nointerlineskip
        \kern7.5ex\par
        %----------------------------------------------------------------------------------
        % Descrição da monografia ("Tese apresentada como requisito...")
        %----------------------------------------------------------------------------------
        \hbox{}\hfill\vbox{%
            \hsize=23cm
            \parfillskip0pt plus1fil
            \divide\hsize by3\relax
            \leftskip0pt
            \rightskip0pt
            \hyphenpenalty=10000\relax
            \emergencystretch=2em
            \noindent\PP@descricao
        }\kern35pt\par\nointerlineskip
        \kern7.5ex\par
        %----------------------------------------------------------------------------------
        % Orientador / Co-Orientador
        %----------------------------------------------------------------------------------
        \vbox{%
            \leftskip0pt plus1fil
            \rightskip0pt plus1fil
            \noindent\hbox{\PP@orientadorname{}: Prof.\ \PP@orientador}%
            \ifx\PP@coorientador\PP@undef\relax
            \else\par\noindent\hbox{Co-\PP@orientadorname{}: Prof.\ \PP@coorientador}\fi
        }\par\nointerlineskip%
        \vfill\par
        %----------------------------------------------------------------------------------
        % Cidade / ano
        %----------------------------------------------------------------------------------
        \vbox{%
            \leftskip0pt plus1fil
            \rightskip0pt plus1fil
            \bfseries
            \noindent\hbox{\PP@Cid}\par
            \noindent\hbox{\number\year}%
        }\par\nointerlineskip
        \kern3ex\par
    }%
\end{titlepage}%
\global\let\maketitle\relax
\global\let\@author\@empty
\global\let\@title\@empty
\global\let\title\relax
\global\let\author\relax
\global\let\and\relax
\global\let\PP@Uni\@empty
\global\let\PP@Fac\@empty
\global\let\PP@Dep\@empty
\global\let\PP@Cid\@empty
\global\let\PP@orientadorname\@empty
\global\let\PP@descricao\@empty
\global\let\PP@orientador\@empty
\global\let\PP@coorientador\@empty
\global\let\PP@grau\@empty
\global\let\tipotrabalho\relax
\global\let\grau\relax
\global\let\orientador\relax
\global\let\coorientador\relax
\newpage%
}

%----------------------------------------------------------------------------------
% Gera uma página para ser substituída na versão final (ficha
% catalográfica ou termo de apresentação)
%----------------------------------------------------------------------------------
\newcommand*\PP@replacepage[1]{%
   %\if@openright\cleardoublepage\else\clearpage\fi
   \cleardoublepage%
   \thispagestyle{empty}%
   \vbox to\textheight{%
      \parfillskip0pt
      \parskip0pt
      %\baselineskip0pt
      \parindent0pt
      \leftskip0pt plus1fil
      \rightskip0pt plus1fil
      \vss\par\nointerlineskip
      \hbox to\hsize{%
         \hss
         \vbox{\hsize=11.5cm\bfseries\Huge\MakeTextUppercase{#1}}%
         \hss
      }%
      \par\nointerlineskip
      \vss
   }%
   \newpage%
}

%----------------------------------------------------------------------------------
% Gera as páginas para serem substituídas pela ficha
% catalográfica e o termo de apresentação
%----------------------------------------------------------------------------------
\newcommand*{\fillers}{%
   \PP@replacepage{\PP@fichaname}%
   \PP@replacepage{\PP@termoname}%
   %\renewcommand*{\baselinestretch}{1.5}
}

%----------------------------------------------------------------------------------
% Formata uma página de capítulo pré-textual genérica
%----------------------------------------------------------------------------------
\newenvironment{pretextual}[1]
     {%
       %\if@openright\cleardoublepage\else\clearpage\fi
       \cleardoublepage
       \thispagestyle{empty}%
%      \@afterindentfalse
       {\parindent\z@
        \centering
        \normalfont
        \interlinepenalty\@M
        \bfseries\MakeTextUppercase{#1}\par\nointerlineskip\nobreak
        \normalfont\normalsize
        \vskip 19.5ex}%
       \@afterheading
     }%
     {\newpage}

%----------------------------------------------------------------------------------
% Dedicatória
%
% #1: texto da dedicatória.
%----------------------------------------------------------------------------------
\newcommand{\dedicatoria}[1]{%
    \begin{pretextual}{\PP@dedicatorianame}%
      #1\relax
    \end{pretextual}%
    \global\let\PP@dedicatorianame\@empty
}

%----------------------------------------------------------------------------------
% Epígrafe (interno, só formata o pensamento na página atual)
%
% #1: frase.
% #2: autor.
%----------------------------------------------------------------------------------
\newcommand{\PP@epigrafe}[2]{%
    \hbox to\textwidth{%
        \hss\vbox{%
           \hsize=3.32in
           \parindent0pt
          ``#1''\par
          (#2)\relax
        }%
    }%
}

%----------------------------------------------------------------------------------
% Epígrafe
%
% #1: texto do pensamento (sem aspas)
% #2: autor (sem parênteses)
%----------------------------------------------------------------------------------
\newcommand{\epigrafe}[2]{%
    %\if@openright\cleardoublepage\else\clearpage\fi
    \cleardoublepage
    \thispagestyle{empty}%
    \normalfont\normalsize
    \vbox to\textheight{%
        \parskip0pt
        \parindent0pt
        \vss
        \noindent\PP@epigrafe{#1}{#2}%
    }%
    \newpage%
}

%----------------------------------------------------------------------------------
% Dedicatória e epígrafe (na mesma página)
%
% #1: texto da dedicatória.
% #2: texto do pensamento (sem aspas)
% #3: autor (sem parênteses)
%----------------------------------------------------------------------------------
\newcommand{\dedigrafe}[3]{%
    \dedicatoria{%
        \parskip0pt
        #1\par\nointerlineskip
        \vfill
        \normalfont\normalsize
        \noindent\PP@epigrafe{#2}{#3}%
    }%
}%

%----------------------------------------------------------------------------------
% Agradecimentos
%
% #1: texto do agradecimento
%----------------------------------------------------------------------------------
\newenvironment{agradecimentos}
  {\begin{pretextual}{\PP@agradecimentosname}}%
  {\end{pretextual}%
   \global\let\PP@agradecimentosname\@empty}

%----------------------------------------------------------------------------------
% Abstract/Resumo (comando interno)
%
% #1: título da página ("Resumo" ou "Abstract")
% #2: título das palavras-chave ("Palavras-Chave" ou "Keywords")
% #3: título da monografia
% #4: palavras-chave
%----------------------------------------------------------------------------------
\newenvironment{PP@abstract}[4]
    {%
      \def\PP@kwname{#2}%
      \def\PP@kwtext{#4}%
      %\if@openright\cleardoublepage\else\clearpage\fi
      \cleardoublepage
      \thispagestyle{empty}%
      {%
       \parindent\z@
       \centering
       \normalfont
       \interlinepenalty\@M
       \large\bfseries\MakeTextUppercase{#3}\par\nointerlineskip\nobreak
       \normalfont\normalsize
       \vskip 19.5ex
      }%
      {%
       \parindent\z@
       \centering
       \normalfont
       \interlinepenalty\@M
       \bfseries\MakeTextUppercase{#1}\par\nointerlineskip\nobreak
       \normalfont\normalsize
       \vskip 19.5ex
      }%
      \@afterheading
   }%
   {\null\vskip 2cm
   \begin{description}%
     \item[\PP@kwname{}:] \PP@kwtext{}.%
   \end{description}%
   \let\PP@kwname\@empty
   \let\PP@kwtext\@empty
   \newpage}

%----------------------------------------------------------------------------------
% Resumo em língua portuguesa
%
% #1: palavras-chave
%----------------------------------------------------------------------------------
\newenvironment{resumo}[1]%
    {\begin{hyphenrules}{brazil}%
     \begin{PP@abstract}{Resumo}{Palavras-Chave}{\@titlept}{#1}}%
    {\global\let\@titlept\@empty
     \end{PP@abstract}%
     \end{hyphenrules}}

%----------------------------------------------------------------------------------
% Resumo em língua inglesa
%
% #1: palavras-chave
%----------------------------------------------------------------------------------
\renewenvironment{abstract}[1]%
    {\begin{hyphenrules}{english}%
     \begin{PP@abstract}{Abstract}{Keywords}{\@titleen}{#1}}%
    {\global\let\@titleen\@empty
     \end{PP@abstract}%
     \end{hyphenrules}}

%----------------------------------------------------------------------------------
% Lista de algoritmos
%----------------------------------------------------------------------------------
%\addto\captionsbrazil{%
  \newcommand*\listalgorithmname{Lista de Algoritmos}
  \newcommand*\algorithmname{Algoritmo}
%}
\addto\captionsenglish{%
  \renewcommand*\listalgorithmname{List of Algorithms}
  \renewcommand*\algorithmname{Algorithm}
}
\newcounter{algorithm}[chapter]
\renewcommand \thealgorithm
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@algorithm}
\def\ftype@algorithm{2}
\def\fps@algorithm{htbp}
\def\ext@algorithm{loa}
\def\fnum@algorithm{\algorithmname\nobreakspace\thealgorithm}
\newenvironment{algorithm}
               {\@float{algorithm}}
               {\end@float}
\newenvironment{algorithm*}
               {\@dblfloat{algorithm}}
               {\end@dblfloat}
\newcommand\listofalgorithms{\chapter*{\listalgorithmname}\@starttoc{loa}}
%----------------------------------------------------------------------------------
% Lista de siglas
%----------------------------------------------------------------------------------
%\addto\captionsbrazil{%
  \newcommand*\listacronymname{Lista de Siglas}
%}
\addto\captionsenglish{%
  \renewcommand*\listacronymname{List of Acronyms}
}
\newcommand\listofacronyms{\chapter*{\listacronymname}\@starttoc{los}}

%----------------------------------------------------------------------------------
% Comando para inserir novas siglas. Este trecho foi modificado a
% partir do comando interno \@dottedtocline do LaTeX.
%
% \sigla{DDS}{Definição da Sigla}
%----------------------------------------------------------------------------------
\newcommand{\sigla}[2]{\addcontentsline{los}{acronym}{\MakeTextUppercase{#1}\nobreakspace--\nobreakspace #2}}
\newcommand*{\l@acronym}[2]{%
 \vskip \z@ \@plus.2\p@
 {\leftskip 1.5em
  \rightskip \@tocrmarg
  \parfillskip -\rightskip
  \parindent 1.5em
  \@afterindenttrue
  \interlinepenalty\@M
  \leavevmode
  \@tempdima 2.3em
  \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
  {#1}\nobreak\hfill\hbox{}\par}%
}

%----------------------------------------------------------------------------------
% Lista de abreviaturas
%----------------------------------------------------------------------------------
%\addto\captionsbrazil{%
  \newcommand*\listabbrevname{Lista de Abreviaturas}
%}
\addto\captionsenglish{%
  \renewcommand*\listabbrevname{List of Abbreviations}
}
\newcommand\listofabbreviations{\chapter*{\listabbrevname}\@starttoc{lov}}
%----------------------------------------------------------------------------------
% Comando para inserir novas abreviaturas:
%
% \abrev{Abrev}{Abreviatura} ("Abrev" SEM PONTO no final)
%----------------------------------------------------------------------------------
\newcommand{\abrev}[2]{\addcontentsline{lov}{abbreviation}{#1.\nobreakspace--\nobreakspace #2}}
\global\let\l@abbreviation\l@acronym

%----------------------------------------------------------------------------------
% Lista de símbolos
%----------------------------------------------------------------------------------
%\addto\captionsbrazil{%
  \newcommand*\listsymbolname{Lista de S\'{i}mbolos}
%}
\addto\captionsenglish{%
  \renewcommand*\listsymbolname{List of Symbols}
}
\newcommand\listofsymbols{\chapter*{\listsymbolname}\@starttoc{lob}}
%----------------------------------------------------------------------------------
% Comando para inserir novos símbolos:
%
% \simbolo{Hz}{Hertz}
%----------------------------------------------------------------------------------
\newcommand{\simbolo}[2]{\addcontentsline{lob}{symbol}{#1\nobreakspace--\nobreakspace #2}}
\newcommand*\l@symbol{\@dottedtocline{1}{1.5em}{2.3em}}

%----------------------------------------------------------------------------------
% Redefinindo formatação do cabeçalho: apenas o número da página em
% fonte menor que a do texto
%----------------------------------------------------------------------------------
\def\ps@headings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  % XXX
  \def\@evenhead{\small\thepage}%\hfil\slshape\leftmark}%
  % XXX
  \def\@oddhead{\hfil\small\thepage}%{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\markboth
\def\chaptermark##1{%
  \markboth {\MakeTextUppercase{%
    \ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ %
    \fi
    ##1}}{}}%
\def\sectionmark##1{%
  \markright {\MakeTextUppercase{%
    \ifnum \c@secnumdepth >\z@
      \thesection. \ %
    \fi
    ##1}}}}

%----------------------------------------------------------------------------------
% Redefinindo o comando interno do LaTeX para formatar legendas,
% para incluir 'Figura' ou 'Tabela' ao lado do número de cada uma
% nas listas de figuras e tabelas.
%----------------------------------------------------------------------------------
\long\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
    % XXX
   %{\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
    {\csname #1name\endcsname\nobreakspace\protect\numberline{\csname the#1\endcsname\hfil\nobreakspace--\nobreakspace}{\ignorespaces #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

%----------------------------------------------------------------------------------
% Redefinindo o comando de legendas da classe report para
% substituir 'Figura x.y:' por Figura x.y - '
%----------------------------------------------------------------------------------
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  % XXX
%  \sbox\@tempboxa{#1: #2}%
  \sbox\@tempboxa{#1 -- #2}%
  \ifdim \wd\@tempboxa >\hsize
  % XXX
%    #1: #2\par
    #1 -- #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%----------------------------------------------------------------------------------
% Respectivamente, redefinimos os comandos para legendas em long tables.
%----------------------------------------------------------------------------------
\def\LT@makecaption#1#2#3{%
  \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\LTcapwidth{%
    \sbox\@tempboxa{#1{#2 -- }#3}%
    \ifdim\wd\@tempboxa>\hsize
      #1{#2 -- }#3%
    \else
      \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \endgraf\vskip\baselineskip}%
  \hss}}}

\def\LT@c@ption#1[#2]#3{%
  \LT@makecaption#1\fnum@table{#3}%
  \def\@tempa{#2}%
  \ifx\@tempa\@empty\else
     {\let\\\space
     \addcontentsline{lot}{table}{\tablename\nobreakspace\protect\numberline{\thetable\hfil\nobreakspace--\nobreakspace}{\ignorespaces #2}}}%
  \fi}

%----------------------------------------------------------------------------------
% Redefinindo o sumário para usar frente e verso automaticamente e
% configurar o estilo da página para o resto do trabalho.
%----------------------------------------------------------------------------------
\renewcommand\tableofcontents{%
    % Desnecessário
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeTextUppercase\contentsname}{\MakeTextUppercase\contentsname}}%
    \@starttoc{toc}%
    % Desnecessário
    \if@restonecol\twocolumn\fi
    % XXX
    %\if@openright\cleardoublepage\else\clearpage\fi
    \cleardoublepage
    \pagestyle{headings}%
    }

%----------------------------------------------------------------------------------
% Redefinindo o formato dos capítulos e seções...
%----------------------------------------------------------------------------------
\renewcommand\chapter{%\if@openright\cleardoublepage\else\clearpage\fi
                      \cleardoublepage
                     % XXX
%                    \thispagestyle{plain}%
                    \global\@topnum\z@
                     % XXX
%                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
% Capítulos com numeração ficam alinhados à esquerda com número e
% a mesma indentação do parágrafo (após o número).

\def\PP@chaptertypeout{}
\def\PP@chapternumberline{\thechapter}
\def\PP@chapterfmt#1{\MakeTextUppercase{#1}}
\def\PP@chapterfmtnodepth#1{\MakeTextUppercase{#1}}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\PP@chaptertypeout{}\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         % XXX
                         {\protect\numberline{\PP@chapternumberline}\PP@chapterfmt{#1}}%
                    \else
                        % XXX
                        \addcontentsline{toc}{chapter}{\PP@chapterfmtnodepth{#1}}%
                    \fi
                    \chaptermark{#1}%
                    % Coloca um espaço vertical entre figuras de capítulos diferentes.
                    % XXX
%                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  {\parindent\z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \leavevmode\hbox to 4em{\large\bfseries\thechapter.\ }%
%    \large\bfseries\expandafter\MakeTextUppercase\expandafter{#1}\par\nointerlineskip\nobreak%
    % XXX
    \large\bfseries\MakeTextUppercase{#1}\par\nointerlineskip\nobreak
    \normalfont\normalsize
    \vskip 6ex
  }}
% Capítulos sem numeração ficam centralizados (sumário, listas, resumo, etc.)
\def\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading}
\def\@makeschapterhead#1{%
  {\parindent\z@
    \centering
    \normalfont
    \interlinepenalty\@M
    % XXX
    \large\bfseries\MakeTextUppercase{#1}\par\nointerlineskip\nobreak
    \normalfont\normalsize
    \vskip 6ex
  }}

%----------------------------------------------------------------------------------
% Redefinindo comando para formatar capítulos no sumário,
% i. e., com linhas e tudo mais.
%----------------------------------------------------------------------------------
\newlength\PP@tocitemindent
\setlength\PP@tocitemindent{3.2em}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    {\leftskip \z@\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent \z@ \relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima \PP@tocitemindent
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
%     % XXX
%     \setbox\PP@tmpbox=\hbox{#2}%
%     \PP@tmpdim=\wd\PP@tmpbox
%     \edef\@pnumwidth{\PP@tmpdim}%
%     %---
     {\bfseries#1}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor\bfseries #2}%
     \par
     \penalty\@highpenalty}%
  \fi}
%----------------------------------------------------------------------------------
% Redefinindo comando para formatar figuras, algoritmos e tabelas no sumário.
%----------------------------------------------------------------------------------
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{\PP@tocitemindent}}%{2.3em}} XXX
\let\l@table\l@figure
\let\l@algorithm\l@table

%----------------------------------------------------------------------------------
% Redefinindo distância entre pontinhos no sumário
% para ficarem mais próximos...
%----------------------------------------------------------------------------------
\renewcommand\@dotsep{2.5}

%----------------------------------------------------------------------------------
% Redefinindo comando interno do LaTeX para inserir
% nomes de capítulos e seções em maiúsculo no sumário...
%----------------------------------------------------------------------------------
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
%      #7}%
      % XXX
      \MakeTextUppercase{#7}}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
%        #7}}%
        % XXX
        \MakeTextUppercase{#7}}}%
  \fi
  \@xsect{#5}}

%----------------------------------------------------------------------------------
% Redefinindo comando interno do LaTeX para substituir um espaço indesejado...
%----------------------------------------------------------------------------------
\def\@seccntformat#1{\hbox to \parindent{\csname the#1\endcsname}}

%----------------------------------------------------------------------------------
% Redefinindo comando para formatar seções no sumário,
% sem indentação.
%----------------------------------------------------------------------------------
\renewcommand*\l@section{\@dottedtocline{1}{0em}{3.2em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{0em}{3.2em}}

%----------------------------------------------------------------------------------
% Redefinindo formatação de seções da report.cls
%----------------------------------------------------------------------------------
\renewcommand\section{\@startsection{section}{1}{\z@}%
%                                   {4ex \@plus 1ex \@minus .2ex}%
                                   {3.5ex \@plus 1ex \@minus .2ex}%
                                   {5.2ex \@plus.2ex}%
                                   {\normalfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                    {4ex \@plus 1ex \@minus .2ex}%
                                     {3.5ex \@plus 1ex \@minus .2ex}%
                                     {5.2ex \@plus.2ex}%
                                     {\normalfont\normalsize}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {3.25ex \@plus 1ex \@minus .2ex}%
                                     {1.5ex \@plus.2ex}%
                                     {\normalfont\normalsize}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus 1ex \@minus .2ex}%
                                    {1em}%
                                    {\normalfont\normalsize}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                      {3.25ex \@plus 1ex \@minus .2ex}%
                                      {1em}%
                                      {\normalfont\normalsize}}

%----------------------------------------------------------------------------------
% Ambiente para inserir citações diretas com mais de 3 linhas.
%
% Exemplo de uso:
%
% De acordo com Fulano (2011, p.~21):
% \begin{directcite}
%   bla bla bla bla
% \end{directcite}
%
% Para citações diretas de até 3 linhas, faça assim:
% De acordo com Fulano (2011, p.~21): "bla bla bla, bla 'bla'."
%
%----------------------------------------------------------------------------------
\newenvironment{directcite}%
    {\par\begin{singlespace}\hangafter=0\hangindent=4cm\footnotesize}%\small}%
    {\end{singlespace}\par}%

%----------------------------------------------------------------------------------
% Redefinindo bibliografias, para aparecer no sumário.
%----------------------------------------------------------------------------------
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      % XXX
      \addcontentsline{toc}{chapter}%
      % XXX
      %{\protect\numberline{\thechapter}\expandafter\MakeTextUppercase\expandafter{\PP@bibname}}%
      {\protect\numberline{\null}\expandafter\MakeTextUppercase\expandafter{\PP@bibname}}%
      \@mkboth{\MakeTextUppercase\bibname}{\MakeTextUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\global\let\PP@bibname\@empty}

%----------------------------------------------------------------------------------
% Redefinindo o apêndice
%----------------------------------------------------------------------------------
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  % XXX
  \gdef\@chapupp{\expandafter\MakeTextUppercase\expandafter{\appendixname}}%
  %\gdef\thechapter{\expandafter\MakeTextUppercase\expandafter{\appendixname}\nobreakspace\@Alph\c@chapter}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \gdef\PP@chaptertypeout{\@chapupp\space}%
  \gdef\PP@chapternumberline{}%
  \gdef\PP@chapterfmt##1{\@chapupp\nobreakspace\thechapter\nobreakspace--\nobreakspace\protect\normalfont##1}%
  \gdef\PP@chapterfmtnodepth##1{##1}%

  \gdef\@makechapterhead##1{%
    {\parindent\z@
      \centering
      \normalfont
      \interlinepenalty\@M
      \large\bfseries\MakeTextUppercase{\@chapapp\nobreakspace\thechapter\nobreakspace--\nobreakspace ##1}\par\nointerlineskip\nobreak
      \normalfont\normalsize
      \vskip 6ex
    }}%
}

%----------------------------------------------------------------------------------
% Criando um comando para anexos também, que é a mesma coisa
% (em termos tipográficos) que o apêndice. O código
% foi simplesmente duplicado e renomeado para "Anexo" onde
% necessário.
%----------------------------------------------------------------------------------
\newcommand\anexos{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \xdef\appendixname{\PP@anexoname}%
  \global\let\PP@anexoname\@empty
  \gdef\@chapapp{\appendixname}%
  % XXX
  \gdef\@chapupp{\expandafter\MakeTextUppercase\expandafter{\appendixname}}%
  %\gdef\thechapter{\expandafter\MakeTextUppercase\expandafter{\appendixname}\nobreakspace\@Alph\c@chapter}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \gdef\PP@chaptertypeout{\@chapupp\space\thechapter.}%
  \gdef\PP@chapternumberline{}%
  \gdef\PP@chapterfmt##1{\@chapupp\nobreakspace\thechapter\nobreakspace--\nobreakspace\protect\normalfont##1}%
  \gdef\PP@chapterfmtnodepth##1{##1}%

  \gdef\@makechapterhead##1{%
    {\parindent\z@
      \centering
      \normalfont
      \interlinepenalty\@M
      \large\bfseries\@chapupp\nobreakspace\thechapter\nobreakspace--\nobreakspace ##1\par\nointerlineskip\nobreak
      \normalfont\normalsize
      \vskip 6ex
    }}%
}

\AtEndOfClass{%
    \renewcommand*{\familydefault}{\sfdefault}
    \renewcommand{\chaptername}{}
    \urlstyle{same}
    \normalfont\normalsize
    %% Compensando o deslocamento de 1 polegada que o TeX sempre
    %% coloca na hora de gerar a página...
    %\setlength{\hoffset}{-1in}
    %\setlength{\voffset}{-1in}
    % A opção [a4paper] já toma conta destes valores...
    %\setlength{\paperheight}{297mm}
    %\setlength{\paperwidth}{210mm}
    % Margens de 2cm na horizontal e na vertical
    \setlength{\evensidemargin}{2cm}
    \setlength{\oddsidemargin}{2cm}
    \setlength{\topmargin}{2cm}
    % O tamanho do corpo do texto é o tamanho da página sem as
    % margens.
    \setlength{\textheight}{\paperheight}
    \setlength{\textwidth}{\paperwidth}
    \addtolength{\textwidth}{-2\evensidemargin}
    \addtolength{\textheight}{-4cm}
    % Distância vertical entre o corpo do texto e o cabeçalho.
    \setlength{\headsep}{3ex}
    % Altura do cabeçalho.
    \setlength{\headheight}{16pt}
    % Remove o cabeçalho e a separação da margem vertical, que vai
    % até o cabeçalho.
    \addtolength{\topmargin}{-\headsep}
    \addtolength{\topmargin}{-\headheight}
    % Distância da base do texto até a base do rodapé.
    \setlength{\footskip}{\headsep}
    \addtolength{\footskip}{\baselineskip}
    % Notas de margem.
    \setlength{\marginparpush}{1mm}
    \setlength{\marginparsep}{2mm}
    \setlength{\marginparwidth}{1.6cm}
    % Indentação de parágrafos.
    \setlength{\parindent}{4em}
    % Distância vertical entre dois parágrafos.
    \setlength{\parskip}{1mm}
    \setlength{\itemsep}{1mm}
    %\setlength{\parskip}{\medskipamount}
    % Distância do início do corpo da página até a primeira linha
    % (baseline) de texto.
    \setlength{\topskip}{4.5ex}
    % Este layout não usa colunas, então não precisamos destes
    % parâmetros.
    \setlength{\columnsep}{0pt}
    \setlength{\columnseprule}{0pt}
    \setlength{\columnwidth}{0pt}
    % Ao invés de mexer em \hoffset e \voffset, mexemos nas
    % margens, que evita conflitos com outros pacotes.
    \addtolength{\evensidemargin}{-1in}
    \addtolength{\oddsidemargin}{-1in}
    \addtolength{\topmargin}{-1in}

    % Posicionamento padrão de figuras e tabelas, aceitando:
    % h - na posição pedida, se possível;
    % ! - não respeita as regras "normais" de
    %     posicionamento do LaTeX;
    % t - no topo da página; ou
    % b - no final da página
    \floatplacement{figure}{htb!}
    \floatplacement{table}{htb!}
    \pagestyle{empty}
    % Evita ao máximo linhas viúvas e órfãs em parágrafos.
    \global\widowpenalty=10000
    \global\clubpenalty=10000
    %\addto\captionsbrazil{\renewcommand*{\bibname}{Refer\^{e}ncias~Bibliogr\'{a}ficas}}
    \addto\captionsenglish{\renewcommand*{\bibname}{References}}
    %\addto\captionsbrazil{\renewcommand*{\contentsname}{Sum\'{a}rio}}
    %\addto\captionsbrazil{\renewcommand*{\figurename}{Figura}}
    %\addto\captionsbrazil{\renewcommand*{\tablename}{Tabela}}

    % O pacote 'hyperref' automaticamente cria hyperlinks para navegação no
    % documento. Como ele reescreve muitos comandos internos do LaTeX,
    % deve ser o *último* pacote inserido antes do início do documento.
    \RequirePackage[%
        breaklinks=true,%
        unicode,%
        bookmarks,%
        hidelinks,%
        urlcolor=blue%
    ]{hyperref-compat}

    \expandafter\selectlanguage\expandafter{\PP@language}
}

\AtBeginDocument{%
    \expandafter\selectlanguage\expandafter{\PP@language}
    \maketitle

    \hypersetup{
        pdfauthor=\@author,
        pdftitle=\@title
    }
    % Com a opção oneside, o ambiente titlepage reinicia o contador
    % de páginas para 1 após gerar a página de título, então
    % precisamos corrigir para 2.
    \if@twoside\else\setcounter{page}\tw@\fi
    \onehalfspacing
    \ifx\PP@tipo\tese\fillers\else
    \ifx\PP@tipo\dissertacao\fillers\fi\fi
    \global\let\PP@tipo\@empty
    \global\let\PP@fichaname\@empty
    \global\let\PP@termoname\@empty
}

\endinput
%% End of file 'pucrs-ppgcc.cls'
% vim:foldmethod=indent:textwidth=10000
