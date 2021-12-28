
function Invoke-CleanInstall
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

Export-ModuleMember -Function Invoke-CleanInstall