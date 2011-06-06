#!/bin/bash

site=$(zenity --entry \
  --title="Site Test!" \
  --text="Digite o site." \
  --entry-text="http://")

navs=$(zenity --list \
  --title="Site Test!" \
  --text="Selecione os navegadores." \
  --checklist \
  --column="" --column="navegador" \
  true google-chrome \
  true firefox \
  true opera \
  --separator=":")

echo "$navs"|while IFS=":" read f1 f2 f3
do
[ -z $f1] || $f1 $site & # if [! -z $f1]; then; $f1 $site; fi;
[ -z $f2] || $f2 $site &
[ -z $f3] || $f3 $site &
done

