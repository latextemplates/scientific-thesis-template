# Compile one chapter on its own, in this directory: latexmk "10 - introduction"
# The chapter loads the preamble of the main file (package subfiles). Packages, figures and the
# bibliography are in the parent directory, which is added to the search paths.
do '../.latexmkrc';
$ENV{'TEXINPUTS'} = '..' . $search_path_separator . ($ENV{'TEXINPUTS'} // '');
$ENV{'BIBINPUTS'} = '..' . $search_path_separator . ($ENV{'BIBINPUTS'} // '');
# Spaces in the job name break the ifplatform package, so the PDF is named without them: 10-introduction.pdf
my ($chapter) = grep { !/^-/ } @ARGV;
if (defined $chapter) { ($jobname = $chapter) =~ s/\.tex$//; $jobname =~ s/\s+//g; }
