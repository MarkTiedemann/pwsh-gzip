
$ErrorActionPreference = 'Stop'

$InFile = $args.Get(0)
$OutFile = $args.Get(1)

try {
  $InputStream = New-Object IO.FileStream $InFile, ([IO.FileMode]::Open), ([IO.FileAccess]::Read), ([IO.FileShare]::Read)
  $OutputStream = New-Object IO.FileStream $OutFile, ([IO.FileMode]::Create), ([IO.FileAccess]::Write), ([IO.FileShare]::None)
  $GzipStream = New-Object IO.Compression.GzipStream $OutputStream, ([IO.Compression.CompressionMode]::Compress)
  $Buffer = New-Object Byte[](1024)
  while ($true) {
    $Read = $InputStream.Read($Buffer, 0, 1024)
    if ($Read -le 0) { break }
    $GzipStream.Write($Buffer, 0, $Read)
  }
} finally {
  if ($GzipStream) { $GzipStream.Close() }
  if ($OutputStream) { $OutputStream.Close() }
  if ($InputStream) { $InputStream.Close() }
}
