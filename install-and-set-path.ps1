$installLocation = "C:\dotnetrt"
& "$PSScriptRoot\dotnet-install.ps1" -Runtime aspnetcore -InstallDir $installLocation

$oldPath=(Get-ItemProperty -Path ‘Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment’ -Name PATH).Path

if(!$oldPath.Contains($installLocation)) {
    $newpath = "$installLocation;$oldpath"
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
    Write-Host "Path updated"
} else {
    Write-Host "Already in the path"
}