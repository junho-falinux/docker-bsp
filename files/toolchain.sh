#!/bin/bash
cd /work && \
  source env-4.9.4.env && \
  cd buildroot/${BUILDROOT_DIR} && \
  echo " [*] Building toolchain..." && \
  ./make.sh toolchain 1>/dev/null 2>/dev/null && \
  ./make.sh 1>/dev/null 2>/dev/null && \
  cd /opt && \
  echo " [*] Packaging toolchain..." && \
  tar czf /work/docker/toolchain/arm-buildroot-linux-gnueabihf-4.9.4.tar.gz . 1>/dev/null 2>/dev/null&& \
  cd - 1>/dev/null 2>/dev/null && \
  echo " [*] Cleaning..." && \
  ./make.sh distclean 1>/dev/null 2>/dev/null
