
$ErrorActionPreference = 'Stop'
Set-PSDebug -Trace 1

# Cleanup
Remove-Item test.txt* -Force -ErrorAction SilentlyContinue

# Test
$Expected = "Hello world!"
$TxtFile = "$Pwd\test.txt"
$GzFile = "$Pwd\test.txt.gz"
Set-Content $TxtFile $Expected
.\gzip.ps1 $TxtFile $GzFile
.\gunzip.ps1 $GzFile $TxtFile
$Actual = Get-Content $TxtFile
if ($Actual -ne $Expected) { throw $Actual }

# Cleanup
Remove-Item test.txt* -Force -ErrorAction SilentlyContinue
