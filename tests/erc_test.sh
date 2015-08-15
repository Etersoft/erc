#!/bin/sh -x

# for use our erc and ercat
PATH=../bin:$PATH

fatal()
{
	echo "$@" >&2
	exit 1
}

echo
echo "simple test"
rm -f file1.zip file1.7z
echo "1 2 3" >file1
erc a file1.zip file1
erc file1.zip 7z:

echo
echo "test for error when overriding"

# be zero for assure
truncate --size=0 file1.zip file1.7z || fatal
erc a file1.zip file1 && fatal "must be error when override 1"
erc file1.zip file1 && fatal "must be error when override 2"
rm -f file1.zip
erc a file1.zip file1
erc file1.zip 7z: && fatal "must be error when override 3"
erc repack file1.zip file1.7z && fatal "must be error when override 4"

echo
echo "force overriding"
erc -f a file1.zip file1 || fatal "problem with force overriding 1"
#erc -f file1.zip file1 || fatal "problem with force overriding 2"
erc -f file1.zip 7z: || fatal "problem with force overriding 3"
erc -f repack file1.zip file1.7z || fatal "problem with force overriding 4"

rm -f file1 file1.zip file1.7z
echo "DONE"
