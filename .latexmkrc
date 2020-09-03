#`-file-line-error` is similar to `--interaction nonstopmode`, but shows the concrete line number
#Remove it, it you want pdflatex to stop on errors
$pdflatex = 'pdflatex -shell-escape -file-line-error --synctex=-1 %O %S';

#Use SumatraPDF instead of the default PDF viewer
$pdf_previewer = 'start "C:\Program Files\SumatraPDF\SumatraPDF.exe"';

#SumatraPDF updates automatically
$preview_mode = 0;

#automatically call lualatex/pdflatex (instead of latex)
$pdf_mode = 1;

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries", "-q", $_[0];
  }
  else {
    system "makeglossaries", $_[0];
  };
}

# enable deletion of *.bbl when calling "latexmk -c"
$bibtex_use = 2;

#remove more files than in the default configuration
@generated_exts = qw(acn acr alg aux code ist fls glg glo gls glsdefs idx ind lof lot out thm toc tpt wrt);
$clean_ext .= ' %R.ist %R.xdy';
