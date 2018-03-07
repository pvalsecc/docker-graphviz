FROM ubuntu:17.10

RUN apt-get update && \
    apt-get install --no-install-recommends -y git build-essential ghostscript libpng-dev libgd-dev fontconfig tcl-dev \
                    libdevil-dev libxaw7-dev freeglut3-dev libpango1.0-dev autoconf automake libgs-dev autogen \
                    libtool libltdl-dev ca-certificates libfreetype6-dev zlib1g-dev libjpeg-dev bison flex autotools-dev \
                    libexpat1-dev libfontconfig1-dev libltdl3-dev libgd2-noxpm-dev quilt groff-base \
                    libcairo2-dev guile-2.0-dev librsvg2-dev libtiff-dev libgtkglext1-dev libglade2-dev libgts-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    git clone --depth 1 https://github.com/ellson/graphviz.git src && \
    cd src && \
    ./autogen.sh && \
    make -j8 install && \
    cd .. && \
    rm -rf src && \
    apt remove --purge -y build-essential libtool pkg-config bison automake gcc-7 autogen && \
    dpkg -l *-dev *-headers | grep "^.i" | cut -f 3 -d " " | xargs dpkg --purge

CMD dot -Tpng
