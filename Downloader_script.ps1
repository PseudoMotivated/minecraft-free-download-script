# Set the folder name and file URL
$folderName = "minecraft"
$fileUrl = "https://voice.tamiz.dev/u/AXBrLh.zip"
$mcUrl = "https://skmedix.pl/binaries/_/3.2/SKlauncher-3.2.5.jar"
# Create the folder
New-Item -ItemType Directory -Path $folderName

# Download the files
$filePath = "$folderName\file.zip"
$mcPath = "$folderName\SKlauncher-3.2.5.jar"

Invoke-WebRequest -Uri $fileUrl -OutFile $filePath
Invoke-WebRequest -Uri $mcUrl -OutFile $mcPath

# Unzip the file
Expand-Archive -Path $filePath -DestinationPath $folderName

$javaPath = "$folderName\OpenJDKJRE64\bin\java.exe"
$fullPath = (Join-Path -Path $PWD -ChildPath $javaPath) 
$fullmcPath = (Join-Path -Path $PWD -ChildPath $mcPath) 
# Create a text file with the file location
$textFilePath = "$folderName\starter.bat"

Add-Content -Path $textFilePath -Value "`"$fullPath`" -jar `"$fullmcPath`""

# Output the file location
Write-Host "File location: $textFilePath"
