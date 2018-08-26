PP-LaTeX
========

LaTeX class (and LyX format) for the accepted standard for theses and dissertations at PPGCC/PUCRS, Brazil (2009 model).

For more details and usage specifics, take a look at the `exemplo.tex` file. For an easier setup, it's recommended to use a copy of this file as a starting point for your work.

Usage and requirements
======================

To begin, make sure you have the most recent version of TeXLive installed (<http://www.tug.org/texlive>) for your OS/distribution. To make your life easier, install the additional packages (e. g., `texlive-latexextra` and `texlive-latexrecommended`) as well, along with the language packs for English and Brazilian Portuguese.
On a Linux distribution, just look for the `texlive-full` package on Debian-based distributions, or an equivalent for your distribution of choice (e. g., on Arch Linux, install from the package groups `texlive-most` and `texlive-lang`).
This template should also work fine with online services such as ShareLaTeX (<https://www.sharelatex.com>), although I have not tested this.

Then, simply clone this repository with

```sh
git clone https://github.com/piccoli/PP-LaTeX.git
```

or download the latest snapshot at <https://github.com/piccoli/PP-LaTeX/archive/master.zip>.

Once you have obtained a copy of this repository, you can place your own `.tex` files, data and figures into the same folder. Happy writing!

Disclaimer
==========

Please note that this implementation was **not** officially developed by PPGCC staff, and thus likely won't fully conform with the proposed standard, much less by the PUCRS' central library standard (<http://biblioteca.pucrs.br/apoio-a-pesquisa/modelos-de-normas-tecnicas-de-documentacao>).  It was initially developed by one person in 2012, grown out of personal need.  To this day, it remains unofficially supported by students who are still interested in using LaTeX for writing their Computer Science research work at PPGCC/PUCRS.

That said, be sure to check the latest rules at the PPGCC website (<http://www.inf.pucrs.br/>). Unfortunately, as I'm not in the graduate program anymore, I have no access to the current norms. Therefore, if you find any issues with the format, need something changed to conform to a new rule, or need a new feature for you and your peers' benefit, feel free to open an issue on GitHub. I work on this repository occasionally in my free time, and having open issues in one place helps me to organize and prioritize fixes, which in turn makes the issue more likely to be fixed sooner or at all.

Contributions via forks/pull requests are also very welcome! I look forward for collaborations, as they are essential for keeping this package alive and useful for everyone at the program.
