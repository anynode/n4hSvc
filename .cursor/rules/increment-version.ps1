# Script zum automatischen Erhöhen der Patch-Version
# Verwendung: .cursor\rules\increment-version.ps1

$configFile = "net4home\config.yaml"

if (-not (Test-Path $configFile)) {
    Write-Error "config.yaml nicht gefunden: $configFile"
    exit 1
}

# Aktuelle Version lesen
$content = Get-Content $configFile -Raw
if ($content -match 'version:\s*"(\d+)\.(\d+)\.(\d+)"') {
    $major = [int]$matches[1]
    $minor = [int]$matches[2]
    $patch = [int]$matches[3]
    
    # Patch-Version erhöhen
    $newPatch = $patch + 1
    $newVersion = "$major.$minor.$newPatch"
    
    # Version in Datei ersetzen
    $newContent = $content -replace 'version:\s*"\d+\.\d+\.\d+"', "version: `"$newVersion`""
    Set-Content -Path $configFile -Value $newContent -NoNewline
    
    Write-Host "Version erhöht: $major.$minor.$patch -> $newVersion" -ForegroundColor Green
    return $newVersion
} else {
    Write-Error "Version konnte nicht aus config.yaml gelesen werden"
    exit 1
}
