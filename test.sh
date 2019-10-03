#!/bin/bash
# loop through all files in directory and process all 
# 1. tokenize input text
# 2. flookup morphological analysis
# 3. convert to required CG i/p format
# 4. vislcg3  disambiguation
# elaine oct 2012

#updated tokenization pipeline
cat text.txt | tokenize -utf8 -d 700 ../irishfst/tok/tok-gael.fst | perl ../irishfst/tok/tokclean.prl | flookup -a bin/lexguess.fst | perl dis/lookup2cg3.prl | vislcg3 -g dis/gael-dis.rle 

#original tester pipeline below
#cat test.txt |  tr -sc "[:alnum:]" "[\n*]" | flookup -a bin/lexguess.fst | perl dis/lookup2cg3.prl | vislcg3 -g dis/gael-dis.rle 
