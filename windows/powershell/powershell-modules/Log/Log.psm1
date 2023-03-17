enum LogLevel
{
    debug
    info
    warn
    error
}

function Get-LogColor
{
    <#
        .SYNOPSIS
            Utility function to relate a log level to a color
    #>
    Param(
    #The log level
        [Parameter(Mandatory = $true)]
        [LogLevel]$level
    )

    $colorByLevel = @{
        [LogLevel]::debug = "Green";
        [LogLevel]::info = "Blue";
        [LogLevel]::warn = "Yellow";
        [LogLevel]::error = "Red"
    }

    return $colorByLevel.$level
}

function Write-withLogLevel
{
    <#
        .SYNOPSIS
            Log a message with a specifief log level

        .EXAMPLE
            Write-withLogLevel "HelloWorld" info
    #>
    Param(
    #The message to log
        [Parameter(Mandatory = $true)]
        [string]$message,
    #The log level
        [Parameter(Mandatory = $true)]
        [LogLevel]$level
    )

    $color = Get-LogColor $level

    Write-Host "[$level] $message" -ForegroundColor $color
}

function Write-asDebug
{
    Param(
    #The message to log
        [Parameter(Mandatory = $true)]
        [string]$message
    )

    Write-withLogLevel $message debug
}

function Write-asInfo
{
    Param(
    #The message to log
        [Parameter(Mandatory = $true)]
        [string]$message
    )

    Write-withLogLevel $message info
}

function Write-asWarn
{
    Param(
    #The message to log
        [Parameter(Mandatory = $true)]
        [string]$message
    )

    Write-withLogLevel $message warn
}

function Write-asError
{
    Param(
    #The message to log
        [Parameter(Mandatory = $true)]
        [string]$message
    )

    Write-withLogLevel $message error
}

Export-ModuleMember -Function Write-asDebug
Export-ModuleMember -Function Write-asInfo
Export-ModuleMember -Function Write-asWarn
Export-ModuleMember -Function Write-asError
