# Arrête et supprime les services Windows créés pour le TP (PowerShell en administrateur).
$services = "MongoDB_RS1", "MongoDB_RS2", "MongoDB_RS3", "MongoDB_ARBITER"
foreach ($s in $services) {
    Stop-Service $s -ErrorAction SilentlyContinue
    sc.exe delete $s | Out-Null
}
Write-Host "Services supprimés. Les données restent dans C:\mongodbRep (à supprimer manuellement si besoin)."
