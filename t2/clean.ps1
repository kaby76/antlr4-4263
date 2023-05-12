# Generated from trgen 0.20.20
$(& dotnet clean; $status = $LASTEXITCODE) | Write-Host
$(& Remove-Item bin -Recurse -Force ) 2>&1 | Out-Null
$(& Remove-Item obj -Recurse -Force ) 2>&1 | Out-Null
exit 0
