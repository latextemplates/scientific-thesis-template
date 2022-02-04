FROM reitzig/texlive-base:2021.5
RUN apk update && apk add --no-cache bash perl python3 py3-pip
RUN pip3 install pygments

COPY Texlivefile /work/src

# Emulate "Install dependencies" of "entrypoint work ..."
RUN tlmgr update --self --repository https://mirror.mwt.me/ctan/systems/texlive/tlnet && \
    xargs tlmgr install --repository https://mirror.mwt.me/ctan/systems/texlive/tlnet < "/work/src/Texlivefile" && \
    sha256sum "/work/src/Texlivefile" > "/work/tmp/Texlivefile.sha"

# make latexmk and texlogsieve available
RUN cp /usr/local/texlive/2021/bin/x86_64-linuxmusl/latexmk /usr/local/bin && \
    cp /usr/local/texlive/2021/bin/x86_64-linuxmusl/texlogsieve /usr/local/bin
