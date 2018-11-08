FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04
MAINTAINER steven0129

ENV PATH /miniconda3/bin:$PATH

RUN apt-get update
RUN apt-get install -y git wget cmake
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -bfp /miniconda3 && rm Miniconda3-latest-Linux-x86_64.sh
RUN git clone https://github.com/llvm-mirror/llvm.git
RUN git clone https://github.com/llvm-mirror/clang.git llvm/tools/clang
RUN mkdir llvm/build
RUN cmake -G "Unix Makefiles" llvm
RUN cd llvm/build
RUN ["/bin/bash", "-c", "/usr/bin/make"]
RUN ["/bin/bash", "-c", "/usr/bin/make install"]
RUN cd /

CMD ["bash"]