# Enregistre chaque nœud comme service Windows (évite de garder 3 terminaux ouverts).
# À exécuter dans un PowerShell lancé EN TANT QU'ADMINISTRATEUR.
$Root = "C:\mongodbRep"
$cfg  = "$Root\mongodb\config"

mongod --config "$cfg\rs1.cfg"     --serviceName "MongoDB_RS1"     --serviceDisplayName "MongoDB ReplicaSet Node 1"  --install
mongod --config "$cfg\rs2.cfg"     --serviceName "MongoDB_RS2"     --serviceDisplayName "MongoDB ReplicaSet Node 2"  --install
mongod --config "$cfg\rs3.cfg"     --serviceName "MongoDB_RS3"     --serviceDisplayName "MongoDB ReplicaSet Node 3"  --install
mongod --config "$cfg\arbiter.cfg" --serviceName "MongoDB_ARBITER" --serviceDisplayName "MongoDB ReplicaSet Arbiter" --install

Start-Service MongoDB_RS1, MongoDB_RS2, MongoDB_RS3, MongoDB_ARBITER
Get-Service   MongoDB_RS1, MongoDB_RS2, MongoDB_RS3, MongoDB_ARBITER
