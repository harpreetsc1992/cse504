#!bin/bash

git clone https://github.com/llvm-mirror/llvm.git
cd llvm
git checkout -b test remotes/origin/release_40
cd tools
git clone https://github.com/llvm-mirror/clang.git
cd clang
git checkout -b test remotes/origin/release_40

module load cmake/3.5.1

cd ~/llvm
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ../
make -j 8

cd /gpfs/home/hchawla/llvm/lib/Transforms/MyPass/
(cd ../../../build/; make)
vim MyPass.cpp
ls ~/NPB3.0-omp-C/CG/IRfiles/
(cd ~/NPB3.0-omp-C/CG/; make)
(cd ~/NPB3.0-omp-C/CG/; make CLASS=A)
opt -load ../../../build/lib/LLVMMyPass.so
opt -load ../../../build/lib/LLVMMyPass.so -mypass ~/NPB3.0-omp-C/CG/cg.ll
