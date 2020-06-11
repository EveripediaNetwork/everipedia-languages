#!/bin/bash
# Merge update all po files from latest en export

command_exists () {
    type "$1" &> /dev/null ;
}

if command_exists msgmerge ; then
  msgmerge --backup=none -U ./es.po ../frontend-ssr/translations/everipedia-languages/en.pot
  msgmerge --backup=none -U ./zh.po ../frontend-ssr/translations/everipedia-languages/en.pot
  msgmerge --backup=none -U ./ko.po ../frontend-ssr/translations/everipedia-languages/en.pot
  echo 'Successfully merged latest en translations to es, zh, and ko "po" files'
else
  echo 'Error: msgmerge is not installed. Please install gettext (ubuntu: sudo apt-get install gettext) (Mac: brew install gettext).\nAfter gettext is installed, run "npm run export-pot" again' >&2
  exit 1
fi
