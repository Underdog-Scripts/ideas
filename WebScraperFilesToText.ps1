$TextFile = "D:\Documentation\ModelsList.txt"
$Data = Invoke-Webrequest "https://support.hp.com/hr-en/document/c06456250"
$Data.tostring() -split "[`r`n]" | Out-File -FilePath "D:\Documentation\c06456250.txt"


$Data = Invoke-Webrequest "https://support.hp.com/us-en/document/c06456250"
$ModelList = Get-Content $TextFile
Foreach($Model in $ModelList) {
    $Data.tostring() -split "[`r`n]" | select-string $Model | Export-Csv -Path "D:\Documentation\c06456250.csv" -NoClobber -NoTypeInformation -Append
}
