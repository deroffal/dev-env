# Location
function CdWorkspace([string] $directory)
{
    Set-Location -Path "$Env:w\$directory"
}

Set-Alias -Name cdw -Value CdWorkspace

# Java
function SetJava8
{
    Set-Java 8
}

function SetJava11
{
    Set-Java 11
}

function SetJava14
{
    Set-Java 14
}

function SetJava17
{
    Set-Java 17
}

Set-Alias -Name java8 -Value SetJava8
Set-Alias -Name java11 -Value SetJava11
Set-Alias -Name java14 -Value SetJava14
Set-Alias -Name java17 -Value SetJava17

# Maven
Set-Alias -Name mci -Value Invoke-CleanInstall

# Git
Set-Alias -Name gud -Value Update-GitDirectories
Set-Alias -Name dlb -Value Delete-LocalBranch
Set-Alias -Name gc -Value Invoke-CheckoutBranch
