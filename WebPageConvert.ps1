$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06220540"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06220540.txt"

$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06579918"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06579918.txt"

$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06502052"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06502052.txt"

$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06503049"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06503049.txt"

$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06501966"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06501966.txt"

$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06587734"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06587734.txt"