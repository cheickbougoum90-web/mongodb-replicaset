# Démarre les 3 nœuds sans service Windows (une fenêtre PowerShell par nœud).
#   -Mode cli     : Méthode 1, paramètres en ligne de commande
#   -Mode config  : Méthode 2, fichiers de configuration (recommandé)
# Les fenêtres doivent rester ouvertes pendant toute la durée des tests.
param([ValidateSet("cli","config")][string]$Mode = "config")

$Root = "C:\mongodbRep"
$nodes = @(
    @{ Name = "rs1"; Port = 27017 },
    @{ Name = "rs2"; Port = 27018 },
    @{ Name = "rs3"; Port = 27019 }
)

foreach ($n in $nodes) {
    if ($Mode -eq "cli") {
        $cmd = "mongod --replSet rs0 --port $($n.Port) --dbpath $Root\data\$($n.Name) --bind_ip localhost"
    } else {
        $cmd = "mongod --config `"$Root\mongodb\config\$($n.Name).cfg`""
    }
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $Root; $cmd"
}
