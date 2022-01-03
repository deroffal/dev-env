function Set-Java {
	    <#
        .SYNOPSIS
            Set the java version specified in JAVA_HOME and PATH variables.
			For a 'N' java version, it checks if a JAVA${N}_HOME variable exists with the installation location.

        .EXAMPLE
            Set-Java 17
    #>
    param (
        #Version to set
        [Parameter(Mandatory = $true)]
        [int]$version
    )

     $JAVA_HOME_VALUE = [System.Environment]::GetEnvironmentVariable("JAVA${version}_HOME")

    if($null -eq $JAVA_HOME_VALUE){
        Write-Warning """Unknown Java version : $version
        Please add a 'JAVA${version}_HOME' with Java $version installation"""
        return;
    }

    $Env:JAVA_HOME = $JAVA_HOME_VALUE
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version
}

Export-ModuleMember -Function Set-Java