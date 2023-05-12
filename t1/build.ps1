# Generated from trgen 0.20.20
if (Test-Path -Path transformGrammar.py -PathType Leaf) {
    $(& python3 transformGrammar.py ) 2>&1 | Write-Host
}

$(& dotnet build; $compile_exit_code = $LASTEXITCODE) | Write-Host
exit $compile_exit_code
