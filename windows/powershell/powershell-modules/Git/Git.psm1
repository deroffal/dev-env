function Update-GitDirectories() {
    <#
        .SYNOPSIS
            Process a ``git pull --rebase` in any git directory (first level) of the current directory
    #>
    Get-ChildItem | ? { $_.PSIsContainer } | ? { Test-Path -Path $_\.git } | % { Push-Location $_.FullName; git pull --rebase ; Pop-Location }
}

function Delete-LocalBranch() {
    <#
        .SYNOPSIS
            Delete localy the branch in any git directory (first level) of the current directory
    #>
    param (
        #Name of the branch to delete
        [Parameter(Mandatory = $true)]
        [String]$branchName
    )
    Get-ChildItem | ? { $_.PSIsContainer } | ? { Test-Path -Path $_\.git } | % { Push-Location $_.FullName; git branch -d $branchName ; Pop-Location }
}

function Invoke-CheckoutOrCreate(){
    <#
        .SYNOPSIS
            Either checkout from remote or switch if the branch exists locally (todo/wip)
    #>
    param (
        #Name of the branch
        [Parameter(Mandatory = $true)]
        [String]$branchName
    )
    git checkout -b $branchName 2>/dev/null | git checkout $branchName
}

function Invoke-CheckoutBranch() {
    <#
        .SYNOPSIS
            Either checkout from remote or switch if the branch exists locally in any git directory (first level) of the current directory
    #>
    param (
        #Name of the branch
        [Parameter(Mandatory = $true)]
        [String]$branchName
    )
    Get-ChildItem | ? { $_.PSIsContainer } | ? { Test-Path -Path $_\.git } | % { Push-Location $_.FullName; Invoke-CheckoutOrCreate $branchName ; Pop-Location }
}

Export-ModuleMember -Function Update-GitDirectories
Export-ModuleMember -Function Delete-LocalBranch
Export-ModuleMember -Function Invoke-CheckoutBranch
