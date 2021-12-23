# Location
function Set-Location-Workspace([string] $directory)
{
    Set-Location -Path "$Env:w\$directory"
}

Set-Alias -Name cdw -Value Set-Location-Workspace

# Java
function Set-Java8
{
    $Env:JAVA_HOME = $Env:JAVA8_HOME
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version
}

function Set-Java11
{
    $Env:JAVA_HOME = $Env:JAVA11_HOME
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version
}

function Set-Java14
{
    $Env:JAVA_HOME = $Env:JAVA14_HOME
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version
}

function Set-Java17
{
    $Env:JAVA_HOME = $Env:JAVA17_HOME
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version
}

Set-Alias -Name java8  -Value Set-Java8
Set-Alias -Name java11 -Value Set-Java11
Set-Alias -Name java14 -Value Set-Java14
Set-Alias -Name java17 -Value Set-Java17

# Maven
function mavenCleanInstall
{
    <#
        .SYNOPSIS
            Run a mvn clean install.

        .EXAMPLE
            mci -f parent/pom.xml -st
    #>
    Param(
        #Force the use of an alternate POM file (or directory with pom.xml) (cf -f in mvn)
        [Parameter(Mandatory = $false)]
        [string]$f,
        #If present, skip tests (add -DskipTests to the command)
        [Parameter(Mandatory = $false)]
        [switch]$st
    )

    $command = "mvn clean install"

    if ($f)
    {
        $command = "$command -f $f"
    }

    if ($st)
    {
        $command = "$command -DskipTests"
    }


    Write-Output $command
    Invoke-Expression $command
}

Set-Alias -Name mci -Value mavenCleanInstall
