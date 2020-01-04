#!/usr/bin/env sh

echo '#------------------------------------------------------------------------------#'
echo '# gitignore'
curl -L -s 'https://www.gitignore.io/api/code,emacs,intellij+all,jabref,latex,libreoffice,linux,macos,microsoftoffice,visualstudiocode,windows'
echo ''
echo '#------------------------------------------------------------------------------#'
echo '# custom'
echo ''
echo '/custom/'
echo ''
echo '.vscode/'
echo ''
echo 'main-*.pdf'
echo 'graphics/*.pdf_tex'
echo 'democode.tex'
echo ''
echo '# plantuml'
echo '*-plantuml.latex'
echo '*-plantuml.txt'
echo ''
echo '# latexindent'
echo '*.bak'
echo '*.bak?'
echo '*.bak??'
echo ''
echo '# tex4ht'
echo '*.4ct'
echo '*.4tc'
echo ''
echo '# configured in packages_and_options.tex'
echo '*.code'
