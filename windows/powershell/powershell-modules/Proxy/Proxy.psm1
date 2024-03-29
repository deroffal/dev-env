Set-Variable -Name PROXY_CONF_HOME -Value "~\.proxy" -Option ReadOnly
Set-Variable -Name REMOTE_PROXY_CONF_HOME -Value "$PROXY_CONF_HOME\remote" -Option ReadOnly
Set-Variable -Name OFFICE_PROXY_CONF_HOME -Value "$PROXY_CONF_HOME\office" -Option ReadOnly

function Set-OfficeProxyConfig
<#
        .SYNOPSIS
            Create proxy configuration file for office work.

        .EXAMPLE
            Set-OfficeProxyConfig
    #>
{
    Write-asDebug "Adding .npmrc"
    Copy-Item "$OFFICE_PROXY_CONF_HOME\.npmrc" "~\.npmrc"

    Write-asDebug "Adding .m2/settings.xml"
    Copy-Item "$OFFICE_PROXY_CONF_HOME\settings.xml" "~\.m2\settings.xml"

    Write-asDebug "Adding .docker/config.json"
    Copy-Item "$OFFICE_PROXY_CONF_HOME\config.json" "~\.docker\config.json"

    Write-asDebug "Setting HTTP_PROXY & HTTPS_PROXY"
    $PROXY_URL = [System.Environment]::GetEnvironmentVariable("PROXY_URL")
    $Env:HTTP_PROXY = $PROXY_URL
    $Env:HTTPS_PROXY = $PROXY_URL

}

function Set-RemoteProxyConfig
<#
        .SYNOPSIS
            Create proxy configuration file for remote work.

        .EXAMPLE
            Set-RemoteProxyConfig
    #>
{
    Write-asDebug "Delete .npmrc"
    Remove-Item "~\.npmrc"

    Write-asDebug "Adding .m2/settings.xml"
    Copy-Item "$REMOTE_PROXY_CONF_HOME\settings.xml" "~\.m2\settings.xml"

    Write-asDebug "Adding .docker/config.json"
    Copy-Item "$REMOTE_PROXY_CONF_HOME\config.json" "~\.docker\config.json"


    Write-asDebug "Unsetting HTTP_PROXY & HTTPS_PROXY"
    $Env:HTTP_PROXY = ""
    $Env:HTTPS_PROXY = ""
}

Export-ModuleMember -Function Set-OfficeProxyConfig
Export-ModuleMember -Function Set-RemoteProxyConfig
