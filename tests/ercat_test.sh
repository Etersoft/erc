#!/bin/sh

# for use our erc and ercat
PATH=../bin:$PATH

echo "123" >file1
echo "456" >file2
echo "789" >file3

erc file1 xz:
erc file2 xz:
erc file3 xz:

rm -f file1 file2 file3

ercat file1.xz file2.xz file3.xz | tee file-all.txt

erc file?.xz gz:
