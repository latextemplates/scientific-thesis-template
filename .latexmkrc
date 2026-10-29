$pdflatex = 'lualatex --file-line-error --synctex=-1 %O %S';

#------------------------------------------------------------------------------#
# compilation

# automatically call lualatex/pdflatex (instead of latex)
$pdf_mode = 1;

# The "realmainfile" option of currfile (loaded for the examples) reads the recorder
# file (.fls), so latexmk takes it for a source file. Its content differs between
# runs (e.g., the font cache LuaLaTeX creates on the first run), which causes
# needless reruns and, after five of them, exit code 12 without any error in the
# log. Ignore the recorder file when checking whether a rerun is needed; this is
# a no-op when nothing reads it.
$hash_calc_ignore_pattern{'fls'} = '^';

# replaces main.pdf by jobname.pdf
# Note: -pvc may then not find the PDF.
#$jobname = 'thesis';

#------------------------------------------------------------------------------#
# preview
# You may put these settings in ~/.latexmkrc instead.

# >0 <-> equivalent to -pv
$preview_mode = 0;
# >0 <-> equivalent to -pvc
#$preview_continuous_mode = 1;

if ($^O eq 'MSWin32') {
  # Use SumatraPDF instead of the default PDF viewer; it reloads the PDF automatically
  $pdf_previewer = 'start "C:\Program Files\SumatraPDF\SumatraPDF.exe"';
}
# 'evince' is 'Document Viewer' (GNOME's default)
#$pdf_previewer = 'evince';

#------------------------------------------------------------------------------#
# bibliography and glossaries

# enable deletion of *.bbl when calling "latexmk -c"
$bibtex_use = 2;

#------------------------------------------------------------------------------#
# cleanup

# remove more files than in the default configuration
@generated_exts = qw(acn acr alg aux code fls glg glg-abr glo glo-abr gls gls-abr glsdefs idx ind ist lof lol lot out run.xml synctex thm toc tpt upa upb wrt);
$clean_ext .= ' %R.ist %R.xdy %R.markdown.in';
