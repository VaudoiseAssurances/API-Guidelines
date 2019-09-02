#!/bin/sh

echo '######################################'
echo '#           BEFORE_INSTALL           #'
echo '#              - START -             #'
echo '######################################'

# echo '---- Cleaning Temp Dir ----'
# cd /tmp
# rm -fr *

# echo '---- Download and unzip install-tl ----'
# wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# tar xvfz install-tl-unx.tar.gz
# cd `ls -d */`

# echo '---- Get install-tl profile ----'
# wget https://raw.github.com/mweibel/BA-Dokumentation/master/travis/texlive-installation.profile

# echo '---- Install texlive with install-tl ----'
# sudo ./install-tl --profile=texlive-installation.profile
# export PATH=$PATH:/usr/local/texlive/2012/bin/x86_64-linux

# echo '---- Prepare installation of additional modules ----'
# cd /tmp
# mkdir -p /usr/local/texlive/2012/texmf/tex/latex

# echo '---- Install tikz-uml ----'
# #wget http://www.ensta-paristech.fr/~kielbasi/tikzuml/src/tikzuml-v1.0b-2013-02-01.tbz
# wget https://dl.dropbox.com/u/6981682/tikzuml.zip
# unzip tikzuml.zip
# sudo mv -v tikzuml /usr/local/texlive/2012/texmf/tex/latex/tikzuml

# echo '---- Install pdfgantt ----'
# #wget http://mirrors.ctan.org/graphics/pgf/contrib/pgfgantt.zip
# wget https://dl.dropbox.com/u/6981682/pgfgantt.zip
# unzip pgfgantt.zip
# sudo mv -v pgfgantt /usr/local/texlive/2012/texmf/tex/latex/pgfgantt

# echo '---- Run texhash ----'
# sudo /usr/local/texlive/2012/bin/x86_64-linux/texhash /usr/local/texlive/2012/texmf

cd /tmp
wget https://dl.dropbox.com/u/694056/texlive.tar.gz
tar xzf texlive.tar.gz
PATH=$PATH:/tmp/texlive/2012/bin/x86_64-linux

echo '######################################'
echo '#           BEFORE_INSTALL           #'
echo '#            - FINISHED -            #'
echo '######################################'
