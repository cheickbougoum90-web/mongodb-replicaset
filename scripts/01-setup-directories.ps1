# Crée l'arborescence du TP dans C:\mongodbRep et copie les fichiers de configuration.
# Usage : PowerShell -> .\scripts\01-setup-directories.ps1
$Root = "C:\mongodbRep"

$dirs = @(
    "data\rs1", "data\rs2", "data\rs3", "data\arb",   # un dossier de données par nœud + arbitre
    "logs\mongodb",                                    # journaux
    "mongodb\config"                                   # fichiers .cfg
)
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path (Join-Path $Root $d) | Out-Null
}

Copy-Item "$PSScriptRoot\..\config\*.cfg" "$Root\mongodb\config" -Force
Write-Host "Arborescence créée et configurations copiées dans $Root" -ForegroundColor Green
