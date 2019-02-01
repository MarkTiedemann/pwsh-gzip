#!/bin/sh

set -ev

# Cleanup
rm -f test.txt*

# Prepare
text="Hello world!"
echo "$text" > test.txt

# Test gzip
pwsh gzip.ps1 test.txt test.txt.gz
gunzip -f test.txt.gz
grep -q "$text" test.txt

# Test gunzip
gzip -f test.txt
pwsh gunzip.ps1 test.txt.gz test.txt
grep -q "$text" test.txt

# Cleanup
rm -f test.txt*
