
Get-ExecutionPolicy

$global:ComputerIp=$null
$global:ComputerName=$null
$global:ask=$false
$global:isRunning=$false
$global:short=$false

$options = @{
        opt1 = [bool] 0
}
$help = @"
    Pi port status usage: pps [-h/--help] [-s/--short]
 
    Pi port status v.0.01.20210707
 
    Tiny tool to check Pi network peer public ports
 
    Options:         
        -s,--short      Short       Short version for 03 main peer ports only
        -h,--help   	Help        Prints helper
"@

function parseOptions ($argv, $options)
{
    $opts = @()
    if (!$argv) { return $null }
    foreach ($arg in $argv)
    {
        if ($arg -like '-*') { $opts += $arg }
    }
    $argv = [Collections.ArrayList]$argv
    if ($opts)
    {
        foreach ($opt in $opts)
        {
            if ($opt -eq '-s' -or $opt -eq '--short')
            {
                $options.opt1 = [bool] 1
            }
            else
            {
                Write-Host $help -ForegroundColor Cyan;
                break 1;
            }
            $argv.Remove($opt)
        }
    }
    return [array]$argv,$options
}

function check_default_pi_port($addr)		
{
    if ([string]::IsNullOrEmpty($addr)) {Write-Error "ERROR: Invalid ip address"}
    Write-Host ""
    Write-Host "Checking default opened Pi ports..."
    $PortRange = 31400..31409
    if ($global:short -eq $true)
    {
        $PortRange = 31401..31403
    }
    $cn = hostname
    ForEach ($p in $PortRange)
    {
        $r = (Test-NetConnection -ComputerName "$cn" -Port $p).TcpTestSucceeded
        if($r)
        {
            $msg = "Pi node $addr port $p open"
            Write-Host $msg -ForegroundColor Green
        }
        else
        {
            $msg = "Pi node $addr port $p close"
            if ($p -eq 31402)
            {
                Write-Host $msg -ForegroundColor Red
                $global:ask = $true
            }
            else
            {
                Write-Warning $msg
            }
        }
    }
}

Get-Date
Write-Host ""

$argv,$options = parseOptions $args $options
if ($options.opt1)
{
    $global:short=$true
}

$IsDockerRunning = Get-Process docker -ErrorAction SilentlyContinue
if($IsDockerRunning -eq $null)
{
    Write-host "docker not running" -ForegroundColor Red
}
else
{
    $d = docker --version
    Write-Host "$d"
    docker version
    docker-compose  --version
    $global:isRunning = $true
}

$IP4 = ipconfig | findstr IPv4
$IP4 = $IP4 | findstr 192
$ip = $IP4.Split(":")
$global:ComputerIp = $ip[1].trim()
check_default_pi_port($global:ComputerIp)

# start an endless loop
while ($global:ask -and $global:isRunning)
{

    $choice = Read-Host "Do you want to restart docker container? Y/N "
    if ($choice -eq 'n' -or $choice -eq 'N') { break }
    $badInput = $true
    if ($choice -eq 'y' -or $choice -eq 'Y')
    {
        $badInput = $false
        ($pnd = docker ps -q) | out-null 
        docker restart $pnd
        if (-Not $?)
        {
            Write-Host "Docker container problems" -ForegroundColor Red	
        }
        else
        {
            Write-Host "Please wait 1-2 mins for docker normalization" -ForegroundColor Green
        }
        break
    }

    # if you received bad input, show a message, wait a couple 
    # of seconds so the message can be read and start over
    if ($badInput)
    {
        Write-Host "Bad input!" -ForegroundColor Red
        Start-Sleep -Seconds 4
    }
}

Write-Host ""
Write-Host "Success!"
exit
