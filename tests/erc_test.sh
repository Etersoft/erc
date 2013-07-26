#!/bin/sh

# for use our erc and ercat
PATH=../bin:$PATH

echo "1 2 3" >file1
erc a file1.zip file1
erc file1.zip 7z:

# rm -f file1 file1.zip
