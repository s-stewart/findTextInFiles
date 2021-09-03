# $Path = "C:\"
# $Text = "Anti-Phishing"
# $PathArray = @()
# $Results = "C:\temp\test.txt"


# This code snippet gets all the files in $Path that end in ".txt".
# Get-ChildItem $Path -Filter "*.*" | Where-Object { $_.Attributes -ne "Directory"} |
# ForEach-Object {
#	If (Get-Content $_.FullName | Select-String -Pattern $Text) {
#		$PathArray += $_.FullName
#		$PathArray += $_.FullName
#		}
#	}
# Write-Host "Contents of ArrayPath:"
# $PathArray | ForEach-Object {$_}

$found = @()
$Text = "Anti-Phishing"

$files = gci c:\\*.*  -recurse -force | ?{!($_.psiscontainer)}

foreach ($file in $files){
	if (select-string $Text $file -SimpleMatch -list){ Write-Host $file }
}