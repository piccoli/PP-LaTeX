#! /usr/bin/env bash
##
## Copyright (C) 2012 Ricardo Piccoli <rfbpiccoli at gmail dot com>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##
# sort.sh: ordena as listas de abreviaturas e siglas para o
# formato LaTeX do modelo de teses, monografias e dissertações do
# PPGCC/PUCRS (2009).

function message() {
   echo "$@" >&2
}

function abort() {
   message "$@ Abortando..."
   exit 1
}

readonly FILE="$1"
readonly CLS="pucrs-ppgcc.cls"

if [[ $# -lt 1 ]]; then
    abort "Uso: $0 <documento.tex>."
fi

set -e
for i in s v; do
    LFILE="${FILE}.lo$i"

    if [[ ! -f $LFILE ]]; then
        continue;
    fi

    sort -d -f -o "${LFILE}~" "$LFILE"
    mv -f "${LFILE}~" "$LFILE"
done

message 'Concluído.'

exit 0
