# Generated from trgen 0.20.20
set -e
if [ -f transformGrammar.py ]; then python3 transformGrammar.py ; fi
dotnet restore
dotnet build
exit 0
