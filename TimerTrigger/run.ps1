# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format.
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' property is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}



# Write an information log with the current time.
Write-Output "PowerShell Timer trigger function executed at:$(get-date)";
 
$FunctionName = 'TimerTrigger'
$ModuleName = 'MSOnline'
$ModuleVersion = '1.1.183.57'
$username = $Env:user
$pw = $Env:password

#import PS module
$PSModulePath = "C:/NHSMail/$FunctionName/bin/$ModuleName/$ModuleVersion/$ModuleName.psd1"
$res = "C:/NHSMail/$FunctionName/bin/"
 
Import-module $PSModulePath
 
# Build Credentials
$keypath = "C:/NHSMail/TimerTrigger/bin/keys/PassEncryptKey.key"

# Connect to MSOnline
 
Connect-MsolService -Credential $credential

