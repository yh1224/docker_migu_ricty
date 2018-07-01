#!/bin/bash
FONTDIR="/vagrant/fonts"
TMPDIR="/home/vagrant/fonts"

mkdir ${FONTDIR} ${TMPDIR} 2>/dev/null

# Checkout M+ font
cd ${TMPDIR}
if [ -d "mplus_outline_fonts" ]; then
  echo "--> Updating mplus_outline_fonts..."
  (cd mplus_outline_fonts && cvs -Q update -dPC) || exit 1
else
  echo "--> Checking out mplus_outline_fonts..."
  cvs -Q -d :pserver:anonymous@cvs.osdn.jp:/cvsroot/mplus-fonts checkout mplus_outline_fonts || exit 1
fi

# Build M+
cd ${TMPDIR}/mplus_outline_fonts
echo "--> Building M+ fonts..."
MPLUS_FULLSET=yes make SPLIT_CONCURRENCY=2 -j2 >${FONTDIR}/build_mplus.log 2>&1
if [ $? -ne 0 ]; then
  echo "failed. see build_mplus.log for detail."
  exit 1
fi
cp work.d/targets/mplus-*/*/mplus-*.ttf ${FONTDIR}
