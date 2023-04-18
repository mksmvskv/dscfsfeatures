function ApplyDscConfiguration {
    param(
        [string]$CompName,
        [string]$dscConfigFileName = "configuration_fileserv.ps1"
    )
    $dscConfigFilePath = Join-Path -Path (Get-Location) -ChildPath $dscConfigFileName
    . $dscConfigFilePath
    FILESERVER -OutputPath .\
    Start-DscConfiguration -Wait -Force -Verbose -Path .\ -ComputerName $CompName
}