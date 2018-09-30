Param(
	[string]$dbType,
	[string]$dbInsta,
	[string]$logFile = "c:\temp\qa-vm-config-$((Get-Date -Format o).Substring(0,19).Replace('-', '').Replace(':', '')).log"
)

Function LogWrite {
   Param ([string]$logstring)

   $text = (Get-Date -Format o).Substring(0,22) + "> " + $logstring
   Add-content $Logfile -value $text
   Write-Host $logstring
}

try
{
	LogWrite "Starting: $($MyInvocation.MyCommand.Name)"
	
	LogWrite "Database type: $dbType"
	LogWrite "Database instance: $dbInsta"
}
catch 
{
	$errorMessage = $_.Exception.Message
	LogWrite "$($MyInvocation.MyCommand.Name), ErrorMsg: $errorMessage"
}
finally
{
	LogWrite "Finished: $($MyInvocation.MyCommand.Name)"
}