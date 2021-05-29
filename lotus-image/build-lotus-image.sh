#!/bin/bash

# This script assumes it's running on Ubuntu v18+ and Docker is available.

# Install Lotus dependencies
sudo apt update
sudo apt install mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config curl clang build-essential hwloc libhwloc-dev wget -y && sudo apt upgrade -y

# Clone the Textile lotus build repo.
git clone https://github.com/textileio/lotus-build
cd lotus-build

# Clone the Lotus repo.
git clone https://github.com/filecoin-project/lotus.git
cd lotus
git checkout v1.8.0

# Build Lotus for the CPU of the current system.
RUSTFLAGS="-C target-cpu=native" FFI_BUILD_FROM_SOURCE=1 make deps

# Build the Docker image
cd ..
docker build -t lotus:trout
