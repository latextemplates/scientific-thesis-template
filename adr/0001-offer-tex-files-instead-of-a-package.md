# Offer tex files instead of a package

It has to be decided how the template is distributed.

## Considered Alternatives

* Distribute using a ZIP file downloadable via GitHub
* Offer as latex package (`.sty`) distributed using CTAN
* Offer as a class file  (`.cls`) distributed using CTAN

## Decision Outcome

* Chosen Alternative: Distribute using a ZIP file downloadable via GitHub
* It should be easy for users to
  1) start using the template and
  2) apply hints from tex.stackexchange or other LaTeX help platforms.
  When distributing as package (`.cls` and `.sty` files) (such as [hagenberg-thesis](https://ctan.org/pkg/hagenberg-thesis)), it is difficult for users to adapt the packages.
  The main reason is that there will be never as much help as for basic classes such as [KOMA-Script](https://www.komascript.de/).
* When there is an update, it will be more difficult for users to pick the updates.
  They could do it by advanced use of git or just by coping the patches manually.
  However, there should not be much updates coming
