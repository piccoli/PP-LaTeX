%% This is file `ppgcc-num.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `babel,lang,annote,nm-rev,ed-rev,aunm-semi,yr-com,tit-qq,qx,thtit-a,vnum-b,volp-com,jwdpg,pp-last,jwdvol,num-xser,ser-vol,btit-rm,bt-rm,pg-bk,add-pub,pub-date,pub-xpar,edpar,bkedcap,blk-tit,in-col,pp,abr,mth-bare,xedn,varand,and-com,and-com-ed,xand,etal-xc,revdata,eprint,url,url-blk,em-it,nfss,')
%% ----------------------------------------
%% *** Formato PPGCC-PUCRS 2009, Copyright (C) 2012 por Ricardo Piccoli (rfbpiccoli at gmail dot com) ***
%%
%% Copyright 1994-2011 Patrick W Daly
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[2011/03/28 4.32 (PWD, AO, DPC)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file requires a file named  babelbst.tex
 %   containing the definitions of word commands like \bbleditor, etc.
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is alphabetical by authors.
 %---------------------------------------------------------------------

ENTRY
  { address
    annote
    archive
    author
    booktitle
    chapter
    collaboration
    edition
    editor
    eid
    eprint
    howpublished
    institution
    journal
    key
    language
    month
    note
    number
    numpages
    organization
    pages
    publisher
    school
    series
    title
    type
    url
    urlaccessdate
    volume
    year
  }
  {}
  { label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t z }
FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
  annote missing$
    { "\bibAnnoteFile{" cite$ * "}" * write$ newline$ }
    { "\bibAnnote{" cite$ * "}{" * annote * "}" * write$ newline$
    }
  if$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  skip$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {remove.dots}
{ 'z :=
   ""
   { z empty$ not }
   { z #1 #2 substring$
     duplicate$ "\." =
       { z #3 global.max$ substring$ 'z :=  * }
       { pop$
         z #1 #1 substring$
         z #2 global.max$ substring$ 'z :=
         duplicate$ "." = 'pop$
           { * }
         if$
       }
     if$
   }
   while$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\textit{" swap$ * "}" * }
  if$
}
FUNCTION {tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {capitalize}
{ "\capitalize{" swap$ * "}" * }

FUNCTION {space.word}
{ " " swap$ * " " * }


%-----------------------------------------
% Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The BABEL language selection is made here; definitions in babelbst.tex.
FUNCTION {bbl.and} { "\bbland{}"}
FUNCTION {bbl.etal} { "\bbletal{}"}
FUNCTION {bbl.editors} { "\bbleditors{}" }
FUNCTION {bbl.editor} { "\bbleditor{}" }
FUNCTION {bbl.edby} { "\bbledby{}" }
FUNCTION {bbl.edition} { "\bbledn{}" }
FUNCTION {bbl.volume} { "\bblvol{}" }
FUNCTION {bbl.of} { "\bblof{}" }
FUNCTION {bbl.number} { "\bblno{}" }
FUNCTION {bbl.nr} { "\bblno{}" }
FUNCTION {bbl.in} { "\bblin{}" }
FUNCTION {bbl.pages} { "\bblpp{}" }
FUNCTION {bbl.page} { "\bblp{}" }
FUNCTION {bbl.chapter} { "\bblchap{}" }
FUNCTION {bbl.techrep} { "\bbltechrep{}" }
FUNCTION {bbl.mthesis} { "\bblmthesis{}" }
FUNCTION {bbl.phdthesis} { "\bblphdthesis{}" }
FUNCTION {bbl.eidpp} { "\bbleidpp{}" }
FUNCTION {bbl.numpages} { "\bbleidpp{}" }

MACRO {jan} {"\bbljan{}"}
MACRO {feb} {"\bblfeb{}"}
MACRO {mar} {"\bblmar{}"}
MACRO {apr} {"\bblapr{}"}
MACRO {may} {"\bblmay{}"}
MACRO {jun} {"\bbljun{}"}
MACRO {jul} {"\bbljul{}"}
MACRO {aug} {"\bblaug{}"}
MACRO {sep} {"\bblsep{}"}
MACRO {oct} {"\bbloct{}"}
MACRO {nov} {"\bblnov{}"}
MACRO {dec} {"\bbldec{}"}
%-----------------------------------------
% TODO
% The language selected here is PORTUGUESE
%FUNCTION {bbl.and} { "e"}
%FUNCTION {bbl.etal} { "et~al." }
%FUNCTION {bbl.editors} { "editores" }
%FUNCTION {bbl.editor} { "editor" }
%FUNCTION {bbl.edby} { "editado por" }
%FUNCTION {bbl.edition} { "ed.\ " }
%FUNCTION {bbl.volume} { "vol.\ " }
%FUNCTION {bbl.of} { "de" }
%FUNCTION {bbl.number} { "n\raise1ex\hbox{\underbar{\scriptsize o}}" }
%FUNCTION {bbl.nr} { "n\raise1ex\hbox{\underbar{\scriptsize o}}" }
%FUNCTION {bbl.in} { "in" }
%FUNCTION {bbl.pages} { "pp.\ " }
%FUNCTION {bbl.page} { "pp.\ " }
%FUNCTION {bbl.eidpp} { "p" }
%FUNCTION {bbl.chapter} { "cap.\ " }
%FUNCTION {bbl.techrep} { "Relat\'{o}rio T\'{e}cnico" }
%FUNCTION {bbl.mthesis} { "Disserta\c{c}\~{a}o de Mestrado" }
%FUNCTION {bbl.phdthesis} { "Tese de Doutorado" }
%
%MACRO {jan} {"Jan"}
%MACRO {feb} {"Fev"}
%MACRO {mar} {"Mar"}
%MACRO {apr} {"Abr"}
%MACRO {may} {"Maio"}
%MACRO {jun} {"Jun"}
%MACRO {jul} {"Jul"}
%MACRO {aug} {"Ago"}
%MACRO {sep} {"Set"}
%MACRO {oct} {"Out"}
%MACRO {nov} {"Nov"}
%MACRO {dec} {"Dez"}
% End module: portuges.mbs

MACRO {acmcs} {"ACM Computing Surveys"}
MACRO {acta} {"Acta Informatica"}
MACRO {cacm} {"Communications of the ACM"}
MACRO {ibmjrd} {"IBM Journal of Research and Development"}
MACRO {ibmsj} {"IBM Systems Journal"}
MACRO {ieeese} {"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} {"IEEE Transactions on Computers"}
MACRO {ieeetcad} {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} {"Information Processing Letters"}
MACRO {jacm} {"Journal of the ACM"}
MACRO {jcss} {"Journal of Computer and System Sciences"}
MACRO {scp} {"Science of Computer Programming"}
MACRO {sicomp} {"SIAM Journal on Computing"}
MACRO {tocs} {"ACM Transactions on Computer Systems"}
MACRO {tods} {"ACM Transactions on Database Systems"}
MACRO {tog} {"ACM Transactions on Graphics"}
MACRO {toms} {"ACM Transactions on Mathematical Software"}
MACRO {toois} {"ACM Transactions on Office Information Systems"}
MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} {"Theoretical Computer Science"}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
FUNCTION {format.eprint}
{ eprint duplicate$ empty$
    'skip$
    { "\eprint"
      archive empty$
        'skip$
        { "[" * archive * "]" * }
      if$
      "{" * swap$ * "}" *
    }
  if$
}
FUNCTION {format.url}
{
  url
  duplicate$ empty$
    { pop$ "" }
    { "\urlprefix\url{" swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }


STRINGS  { bibinfo}

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, jj}{, f.}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { "; " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              ";" *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
FUNCTION {format.names.ed}
{
  format.names
}
FUNCTION {format.authors}
{ author "author" format.names
    duplicate$ empty$ 'skip$
    { collaboration "collaboration" bibinfo.check
      duplicate$ empty$ 'skip$
        { " (" swap$ * ")" * }
      if$
      *
    }
  if$
}
FUNCTION {get.bbl.editor}
{ editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.editors}
{ editor "editor" format.names duplicate$ empty$ 'skip$
    {
      " " *
      get.bbl.editor
      capitalize
   "(" swap$ * ")" *
      *
    }
  if$
}
%FUNCTION {format.book.pages}
%{ pages "pages" bibinfo.check
%  duplicate$ empty$ 'skip$
%    { " " * bbl.pages * }
%  if$
%}

FUNCTION {format.book.numpages}
{ numpages "numpages" bibinfo.check
  duplicate$ empty$ 'skip$
    { bbl.numpages * }
  if$
}

FUNCTION {select.language}
{ duplicate$ empty$
    'pop$
    { language empty$
        'skip$
        { "{\selectlanguage{" language * "}" * swap$ * "}" * }
      if$
    }
    if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {format.title}
{ title
  % (des)comente as três próximas linhas para controlar
  % a capitalização das primeiras letras de cada palavra do título
  duplicate$ empty$ 'skip$
    { "t" change.case$ }
  if$
  "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "\enquote{" swap$ *
      "}" *
      select.language
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in capitalize
  ":" *
  " " * }


FUNCTION {format.year}
{
    year "year" bibinfo.check duplicate$ empty$
     { "there's no year in " cite$ * warning$ }
     'skip$
    if$
    duplicate$ empty$
     'skip$
     {
       before.all 'output.state :=
       ", " swap$ *
     }
    if$
}

FUNCTION {format.date}
{
  month "month" bibinfo.check
  duplicate$ empty$
  year  "year"  bibinfo.check duplicate$ empty$
    { swap$ 'skip$
        { "there's a month but no year in " cite$ * warning$ }
      if$
      *
    }
    { swap$ 'skip$
        {
          swap$
          "~" * swap$
        }
      if$
      *
      remove.dots
    }
  if$
  duplicate$ empty$
    'skip$
    {
      before.all 'output.state :=
    ", " swap$ *
    }
  if$
}

FUNCTION {format.miscdate}
{
    urlaccessdate "urlaccessdate" bibinfo.check
    duplicate$ empty$
    { pop$ format.date }
    { "t" change.case$ remove.dots }
    if$
}

%FUNCTION {format.btitle}
%{ title "title" bibinfo.check
%  duplicate$ empty$ 'skip$
%    {
%      select.language
%    }
%  if$
%}

% formatação de títulos de livros copiada para ficar
% igual aos outros títulos.
FUNCTION {format.btitle}
{ title
  % (des)comente as três próximas linhas para controlar
  % a capitalização das primeiras letras de cada palavra do título
  %duplicate$ empty$ 'skip$
  %  { "t" change.case$ }
  %if$
  "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "\enquote{" swap$ *
      "}" *
      select.language
    }
  if$
}



FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.prefix
      "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { emphasize ", " * swap$ * }
      if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number "number" bibinfo.check }
            { output.state mid.sentence =
                { bbl.number }
                { bbl.number capitalize }
              if$
              number tie.or.space.prefix "number" bibinfo.check * *
              bbl.in space.word *
              series "series" bibinfo.check *
            }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.dashify
        }
        {
          bbl.page swap$
        }
      if$
      tie.or.space.prefix
      "pages" bibinfo.check
      * *
    }
  if$
}
FUNCTION {format.journal.pages}
{ pages duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$
        { pop$ pop$ format.pages }
        {
          ", " *
          swap$
          n.dashify
          pages multi.page.check
            'bbl.pages
            'bbl.page
          if$
          swap$ tie.or.space.prefix
          "pages" bibinfo.check
          * *
          *
        }
      if$
    }
  if$
}
FUNCTION {format.journal.eid}
{ eid "eid" bibinfo.check
  duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$ 'skip$
      {
          ", " *
      }
      if$
      swap$ *
      numpages empty$ 'skip$
        { bbl.eidpp numpages tie.or.space.prefix
          "numpages" bibinfo.check * *
          " (" swap$ * ")" * *
        }
      if$
    }
  if$
}
FUNCTION {format.vol.num.pages}
{ volume field.or.null
  duplicate$ empty$ 'skip$
    {
      bbl.volume swap$ tie.or.space.prefix
      "volume" bibinfo.check
      * *
    }
  if$
  number "number" bibinfo.check duplicate$ empty$ 'skip$
    {
      swap$ duplicate$ empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
      swap$
      % TODO hack! chamar n.dashify?
      "--" swap$ *
    }
  if$ *
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { "" }
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
    }
  if$
}

FUNCTION {format.booktitle}
{
  booktitle "booktitle" bibinfo.check
}

FUNCTION {format.in.bbooktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
      emphasize
      word.in swap$ *
    }
  if$
}
%FUNCTION {format.in.ed.booktitle}
FUNCTION {format.in.booktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
%      editor "editor" format.names.ed duplicate$ empty$ 'pop$
%        {
%          " " *
%          get.bbl.editor
%          capitalize
%          "(" swap$ * "), " *
%          * swap$
%          * }
%      if$
      word.in swap$ *
    }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.thesis.type}
{ type duplicate$ empty$
    'pop$
    { swap$ pop$
      "t" change.case$ "type" bibinfo.check
    }
  if$
}
FUNCTION {format.tr.number}
{ number "number" bibinfo.check
  type duplicate$ empty$
    { pop$ bbl.techrep }
    'skip$
  if$
  "type" bibinfo.check
  swap$ duplicate$ empty$
    { pop$ "t" change.case$ }
    { tie.or.space.prefix * * }
  if$
}
FUNCTION {format.article.crossref}
{
  key duplicate$ empty$
    { pop$
      journal duplicate$ empty$
        { "need key or journal for " cite$ * " to crossref " * crossref * warning$ }
        { "journal" bibinfo.check emphasize word.in swap$ * }
      if$
    }
    { word.in swap$ * " " *}
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  "editor" bibinfo.check
  editor num.names$ duplicate$
  #2 >
    { pop$
      "editor" bibinfo.check
      " " * bbl.etal
      *
    }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            {
              "editor" bibinfo.check
              " " * bbl.etal
              *
            }
            {
             bbl.and space.word
              * editor #2 "{vv~}{ll}" format.name$
              "editor" bibinfo.check
              *
            }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.book.crossref}
{ volume duplicate$ empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      pop$ word.in
    }
    { bbl.volume
      capitalize
      swap$ tie.or.space.prefix "volume" bibinfo.check * * bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { format.booktitle duplicate$ empty$
            { %"need editor, key, or booktitle for " cite$ * " to crossref " *
              "need key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
            }
            { word.in swap$ * }
          if$
          %format.editors
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.org.or.pub}
{ 't :=
  ""
  year empty$
    { "empty year in " cite$ * warning$ }
    'skip$
  if$
  address empty$ t empty$ and
  year empty$ and
    'skip$
    {
      address "address" bibinfo.check *
      t empty$
        'skip$
        { address empty$
            'skip$
            { ": " * }
          if$
          t *
        }
      if$
      year empty$
        'skip$
        { t empty$ address empty$ and
            'skip$
            { ", " * }
          if$
          year "year" bibinfo.check
          *
        }
      if$
    }
  if$
}
FUNCTION {format.publisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.org.or.pub
}

% Referência a Livros
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.sentence
  format.btitle "title" output.check
  new.sentence
  crossref missing$
    { format.publisher.address
        "publisher or year or address" output.check
      format.edition output
      format.bvolume output
      %format.number.series output
    }
    {
  %new.sentence
      format.book.crossref output.nonnull
    }
  if$
  %format.book.pages "pages" output.check
  format.book.numpages "numpages" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.sentence
  format.title "title" output.check
  new.sentence
  howpublished "howpublished" bibinfo.check output
  address "address" bibinfo.check output
  format.year "year" output.check
  %format.book.pages "pages" output.check
  format.book.numpages "numpages" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization "organization" bibinfo.check
      duplicate$ empty$ 'pop$
        { output
          address "address" bibinfo.check output
          new.sentence
        }
      if$
    }
    { format.authors output.nonnull
      new.sentence }
  if$
  format.btitle "title" output.check
  new.sentence
  author empty$
    { organization empty$
        {
          address "address" bibinfo.check output
        }
        'skip$
      if$
    }
    {
      organization "organization" bibinfo.check output
      address "address" bibinfo.check output
    }
  if$
  format.year "year" output.check
  format.edition output
  format.note output
  format.eprint output
  format.url output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.sentence
  format.btitle "title" output.check
  new.sentence
  crossref missing$
    {
      format.publisher.address "publisher or year or address" output.check
      %format.year "year" output.check
      format.edition output
      format.bvolume output
      %format.chapter.pages "chapter and pages" output.check
  %new.sentence
      %format.number.series output
    }
    {
      %format.chapter.pages "chapter and pages" output.check
  %new.sentence
      format.book.crossref output.nonnull
    }
  if$
  %format.edition output
  format.chapter.pages "chapter" output.check
  format.pages "pages and chapter" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title "title" output.check
  new.sentence
  crossref missing$
    {
      format.in.bbooktitle capitalize "booktitle" output.check
      %new.sentence
      format.edition output
      %format.number.series output
      format.editors "editor" output.check
      format.publisher.address "publisher or year or address" output.check
      format.bvolume output
      %format.year "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      %format.chapter.pages output
    }
  if$
  format.chapter.pages "chapter" output.check
  format.pages "pages and chapter" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

% Referência a Artigos em Revistas
FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title "title" output.check
  crossref missing$
    {
      journal
      "journal" bibinfo.check
      emphasize
      "journal" output.check
      format.vol.num.pages "volume and number" output.check
      %format.date "month" output.check "year" output.check
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
    }
  if$
  eid empty$
    { format.journal.pages }
    { format.journal.eid }
  if$
  format.note output
  format.eprint output
%  format.url output
  fin.entry
}

% Referência a Artigos em Conferências
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title "title" output.check
  new.sentence
  crossref missing$
    { format.in.booktitle "booktitle" output.check
      format.editors output
      % TODO
%      format.bvolume output
%      format.number.series output
%      publisher empty$
%        { format.organization.address output }
%        { organization "organization" bibinfo.check output
%          format.publisher.address output
%        }
%      if$
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.year "year" output.check
  format.pages "pages" output.check
  format.note output
  % TODO
  format.eprint output
  %format.url output
  fin.entry
}
FUNCTION {conference} { inproceedings }

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization "organization" bibinfo.check output
    }
    { format.editors output.nonnull }
  if$
  format.btitle "title" output.check
  format.bvolume "volume" output.check
  format.number.series output
  editor empty$
    { publisher empty$
        'skip$
        {
          format.publisher.address output
        }
      if$
    }
    { publisher empty$
        {
          format.organization.address output }
        {
          organization "organization" bibinfo.check output
          format.publisher.address output
        }
      if$
     }
  if$
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

% Referência a Technical Reports, Dissertações e Teses
FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title
  "title" output.check
  format.tr.number output.nonnull
  institution "institution" bibinfo.warn output
  address "address" bibinfo.check output
  format.year "year" output.check
  %format.pages "pages" output.check
  format.book.numpages "numpages" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title
  "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.year "year" output.check
  %format.pages "pages" output.check
  format.book.numpages "numpages" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title
  "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.year "year" output.check
  %format.pages "pages" output.check
  format.book.numpages "numpages" output.check
  format.note output
  format.eprint output
  %format.url output
  fin.entry
}

% Referência a Home Pages
FUNCTION {misc}
{ output.bibitem
  format.authors "author" output.check
  new.sentence
  format.title "title" output.check
  new.sentence
%  howpublished "howpublished" bibinfo.check output
  format.note output
  format.eprint output
  format.url "url" output.check
  %format.date output
  format.miscdate "urlaccessdate or month and year" output.check
  fin.entry
  empty.misc.check
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  format.date output
  format.note "note" output.check
  format.eprint output
  format.url output
  fin.entry
}

FUNCTION {default.type} { misc }
READ
FUNCTION {sortify}
{ purify$
  "l" change.case$
}
INTEGERS { len }
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}
FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" 't := }
            'skip$
          if$
          t sortify *
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}
FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}
ITERATE {presort}
SORT
STRINGS { longest.label }
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" *
  write$ newline$
  % TODO
  %"\hyphenpenalty=10000"
  %write$ newline$
  % TODO
  "\pretolerance=2500"
  write$ newline$
  % TODO
  "\hyphenpenalty=10000"
  write$ newline$
  % TODO
  "\tolerance=200"
  write$ newline$
  % TODO
  "\emergencystretch=15em"
  write$ newline$
  % TODO
%  "\rightskip0pt plus1fil"
%  write$ newline$
  "\newcommand{\enquote}[1]{``#1''}"
  write$ newline$
  "\providecommand{\urlprefix}{\bblcaptured}"
  write$ newline$
  "\providecommand{\selectlanguage}[1]{\relax}"
  write$ newline$
  % TODO
%%  "\input{babelbst.tex}" write$ newline$
  "\newcommand{\Capitalize}[1]{\uppercase{#1}}" write$ newline$
  "\newcommand{\capitalize}[1]{\expandafter\Capitalize#1}" write$ newline$
  "\providecommand{\bibAnnoteFile}[1]{%"
  write$ newline$
  "  \IfFileExists{#1}{\begin{quotation}\noindent\textsc{Key:} #1\\"
  write$ newline$
  "  \textsc{Annotation:}\ \input{#1}\end{quotation}}{}}"
  write$ newline$
  "\providecommand{\bibAnnote}[2]{%"
  write$ newline$
  "  \begin{quotation}\noindent\textsc{Key:} #1\\"
  write$ newline$
  "  \textsc{Annotation:}\ #2\end{quotation}}"
  write$ newline$
  "\providecommand{\eprint}[2][]{#2}"
  write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `ppgcc.bst'.
