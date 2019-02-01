
$ErrorActionPreference = 'Stop'
Set-PSDebug -Trace 1

# Cleanup
Remove-Item test.txt* -Force -ErrorAction SilentlyContinue

# Test
$Expected = "Hello world!"
Set-Content test.txt $Expected
.\gzip.ps1 test.txt test.txt.gz
.\gunzip.ps1 test.txt.gz test.txt
$Actual = Get-Content test.txt
if ($Actual -ne $Expected) { throw $Actual }

# Cleanup
Remove-Item test.txt* -Force -ErrorAction SilentlyContinue
