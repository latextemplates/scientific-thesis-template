$pdflatex = 'lualatex --shell-escape --file-line-error --synctex=-1 %O %S';

#Use SumatraPDF instead of the default PDF viewer
$pdf_previewer = 'start "C:\Program Files\SumatraPDF\SumatraPDF.exe"';

#SumatraPDF updates automatically
$preview_mode = 0;

#automatically call lualatex/pdflatex (instead of latex)
$pdf_mode = 1;

# enable deletion of *.bbl when calling "latexmk -c"
$bibtex_use = 2;

# Glossaries inclusion inspired by https://tex.stackexchange.com/a/44316/9075
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    # we use -lite to avoid an installation of perl
    system "makeglossaries-lite", "-q", $_[0];
  }
  else {
    system "makeglossaries-lite", $_[0];
  };
}

#remove more files than in the default configuration
@generated_exts = qw(acn acr alg aux code fls glg glo glo-abr gls glsdefs idx ind ist lof lol lot out run.xml synctex thm toc tpt upa upb wrt);
$clean_ext .= ' %R.ist %R.xdy';
