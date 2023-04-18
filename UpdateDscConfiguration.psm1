function UpdateDscConfiguration {
    param(
        [string]$computerName,
        [string]$dscConfigFileName = "configuration_fileserv.ps1"
    )

    $dscConfigFilePath = Join-Path -Path (Get-Location) -ChildPath $dscConfigFileName

    $content = Get-Content $dscConfigFilePath -Raw
    $updatedContent = $content -replace 'node\W\".*\"', "node `"$computerName`""
    Set-Content -Path $dscConfigFilePath -Value $updatedContent
}