$ProgressPreference = 'SilentlyContinue'
$phpDir = "$env:USERPROFILE\php"
$zipFile = "$env:USERPROFILE\php84.zip"

if (Test-Path $phpDir) {
    Remove-Item $phpDir -Recurse -Force
}
New-Item -ItemType Directory -Path $phpDir -Force | Out-Null

Write-Host "Downloading PHP 8.4 to $zipFile..."
Invoke-WebRequest -Uri "https://windows.php.net/downloads/releases/php-8.4.23-Win32-vs17-x64.zip" -OutFile $zipFile
Write-Host "Extracting PHP 8.4 to $phpDir..."
Expand-Archive -Path $zipFile -DestinationPath $phpDir -Force
Remove-Item $zipFile -Force

Copy-Item "$phpDir\php.ini-development" "$phpDir\php.ini"
$ini = Get-Content "$phpDir\php.ini"
$ini = $ini -replace ';extension_dir = "ext"', 'extension_dir = "ext"'
$ini = $ini -replace ';extension=curl', 'extension=curl'
$ini = $ini -replace ';extension=fileinfo', 'extension=fileinfo'
$ini = $ini -replace ';extension=gd', 'extension=gd'
$ini = $ini -replace ';extension=mbstring', 'extension=mbstring'
$ini = $ini -replace ';extension=openssl', 'extension=openssl'
$ini = $ini -replace ';extension=pdo_sqlite', 'extension=pdo_sqlite'
$ini = $ini -replace ';extension=sqlite3', 'extension=sqlite3'
$ini = $ini -replace ';extension=zip', 'extension=zip'
Set-Content -Path "$phpDir\php.ini" -Value $ini

Write-Host "Downloading Composer..."
Invoke-WebRequest -Uri "https://getcomposer.org/composer.phar" -OutFile "$phpDir\composer.phar"
Set-Content -Path "$phpDir\composer.bat" -Value '@php "%~dp0composer.phar" %*'

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$phpDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$phpDir", "User")
}
Write-Host "PHP 8.4 and Composer setup successfully completed at $phpDir!"
