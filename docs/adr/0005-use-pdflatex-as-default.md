# Use pdflatex as default

## Context and Problem Statement

Which latex compiler to use?

* pdflatex
* xelatex
* lualatex

## Decision Outcome

Chosen option: "pdflatex", because compiles faster and correct ligatures are required at the final typesetting step only.

### Positive Consequences

* Faster compile time

### Negative Consequences

* Using lualatex just before publication might lead to a different layout and additional effort
* lualatex's power might not be used at all
