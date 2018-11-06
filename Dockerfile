FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04
MAINTAINER steven0129

RUN apt-get update
RUN apt-get install -y git wget cmake
RUN git clone https://github.com/llvm-mirror/llvm.git
RUN git clone https://github.com/llvm-mirror/clang.git llvm/tools/clang
RUN mkdir llvm/build
RUN cmake -G "Unix Makefiles" llvm
RUN cmake --build llvm/build
RUN cmake --build llvm/build --target install

CMD ["bash"]