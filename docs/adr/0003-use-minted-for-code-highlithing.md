# Use minted for code highlighting

## Context and Problem Statement

Source code needs to be highlighted

## Considered Options

* [minted](https://www.ctan.org/pkg/minted)
* [listings](https://www.ctan.org/pkg/listings)
* [pygmentex](https://www.ctan.org/pkg/pygmentex)
* [texments](https://www.ctan.org/pkg/texments)


## Decision Outcome

Chosen option: "minted", because

1. Listings is inferior because it doesn't utilize a full lexer
2. Minted offers integration with [pygments](http://pygments.org/) and is actively maintained.
3. The person who took over minted development, [evaluated all alternatives](https://tex.stackexchange.com/a/103471/9075) and came to the conclusion that minted is the most promising solution.

Positive Consequences:

* Source is highlighted properly

Negative consequences:

* Users need to install python and pygments
