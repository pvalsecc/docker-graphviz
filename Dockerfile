FROM ubuntu:17.04

RUN apt-get update
RUN apt-get install --no-install-recommends -y git build-essential ghostscript libpng-dev libgd-dev fontconfig tcl-dev \
                    libdevil-dev libxaw7-dev freeglut3-dev libpango1.0-dev colorgcc autoconf automake libgs-dev autogen \
                    libtool libltdl-dev ca-certificates libfreetype6-dev zlib1g-dev libjpeg-dev bison flex autotools-dev \
                    libexpat1-dev libfontconfig1-dev libltdl3-dev libgd2-noxpm-dev quilt groff-base \
                    libcairo2-dev guile-2.0-dev librsvg2-dev libtiff-dev libgtkglext1-dev libglade2-dev libgts-dev
RUN git clone --depth 1 https://github.com/ellson/graphviz.git src
RUN cd src; ./autogen.sh
RUN cd src; make -j8 install

CMD dot -Tpng
