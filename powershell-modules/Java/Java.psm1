function Set-Java {
	    <#
        .SYNOPSIS
            Set the java version specified in JAVA_HOME and PATH variables.
			For a 'N' java version, it assumes that a JAVA${N}_HOME variable exists with the installation location.

        .EXAMPLE
            Set-Java 17
    #>
    param (
        #Version to set
        [Parameter(Mandatory = $true)]
        [int]$version
    )

    switch ($version) {
        8 { $JAVA_HOME_VALUE = $Env:JAVA8_HOME }
        11 { $JAVA_HOME_VALUE = $Env:JAVA11_HOME }
        14 { $JAVA_HOME_VALUE = $Env:JAVA14_HOME }
        17 { $JAVA_HOME_VALUE = $Env:JAVA17_HOME }

        default {
            Write-Error "Unknown Java version : $version"
            return;
        }
    }

    $Env:JAVA_HOME = $JAVA_HOME_VALUE
    $Env:PATH = "$Env:JAVA_HOME\bin;$Env:PATH"
    java -version 
}


Export-ModuleMember -Function Set-Java