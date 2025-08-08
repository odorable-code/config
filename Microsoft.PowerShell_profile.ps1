Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BackwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Alt+b -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine
Set-PSReadLineKeyHandler -Chord Ctrl+k -function KillLine
Set-PSReadLineKeyHandler -Chord Ctrl+w -Function UnixWordRubout
Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Yank
Set-PSReadLineKeyHandler -Chord Alt+. -Function YankLastArg
Set-PSReadLineKeyHandler -Chord Ctrl+] -Function GotoBrace
Set-PSReadLineKeyHandler -Chord Ctrl+r -Function ReverseSearchHistory
Set-PSReadLineKeyHandler -Key Alt+UpArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    try { Set-Location .. }
    catch { return }
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function .. {
	try { Set-Location .. }
	catch { return }
}


function New-BalloonNotification {

    Param(
        [Parameter(ValueFromPipeline = $true, mandatory = $true)][String]$Title,
        [Parameter(ValueFromPipeline = $true, mandatory = $true)][String]$Message, 
        [Parameter(ValueFromPipeline = $true, mandatory = $false)][ValidateSet('None', 'Info', 'Warning', 'Error')][String]$Icon = "Info",
        [Parameter(ValueFromPipeline = $true, mandatory = $false)][scriptblock]$Script
    )

    Add-Type -AssemblyName System.Windows.Forms

    $tip = New-Object System.Windows.Forms.NotifyIcon
    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $tip.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $tip.BalloonTipIcon = $Icon
    $tip.BalloonTipText = $Message
    $tip.BalloonTipTitle = $Title 
    $tip.Visible = $true 

    try {
        Register-ObjectEvent $tip BalloonTipClicked BalloonClicked_event -Action { $script.Invoke() } | Out-Null
    }
    catch {}

    $tip.ShowBalloonTip(10000) # Even if we set it for 1000 milliseconds, it usually follows OS minimum 10 seconds

    Start-Sleep -seconds 1
    $tip.Dispose() # Important to dispose otherwise the icon stays in notifications till reboot

    Get-EventSubscriber -SourceIdentifier "BalloonClicked_event"  -ErrorAction SilentlyContinue | Unregister-Event # In case if the Event Subscription is not disposed
}
