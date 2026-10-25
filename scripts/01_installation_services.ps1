# Préparation de l'environnement et installation des nœuds comme services Windows
# À exécuter dans PowerShell en administrateur. MongoDB doit être installé et son dossier bin dans le PATH.

# Dossier de travail, répertoires de données, journaux et configuration
mkdir C:\mongodbRep
cd C:\mongodbRep
mkdir -p ./data/rs1, ./data/rs2, ./data/rs3, ./data/arb
mkdir -p ./logs/mongodb
mkdir -p ./mongodb/config

# Copier ensuite les fichiers config/rs1.cfg, rs2.cfg, rs3.cfg et arbiter.cfg dans C:\mongodbRep\mongodb\config

# Un service Windows par nœud (évite de garder trois terminaux ouverts)
mongod --config "C:\mongodbRep\mongodb\config\rs1.cfg" --serviceName "MongoDB_RS1" --serviceDisplayName "MongoDB ReplicaSet Node 1" --install
mongod --config "C:\mongodbRep\mongodb\config\rs2.cfg" --serviceName "MongoDB_RS2" --serviceDisplayName "MongoDB ReplicaSet Node 2" --install
mongod --config "C:\mongodbRep\mongodb\config\rs3.cfg" --serviceName "MongoDB_RS3" --serviceDisplayName "MongoDB ReplicaSet Node 3" --install
mongod --config "C:\mongodbRep\mongodb\config\arbiter.cfg" --serviceName "MongoDB_ARBITER" --serviceDisplayName "MongoDB ReplicaSet Arbiter" --install

Start-Service MongoDB_RS1, MongoDB_RS2, MongoDB_RS3, MongoDB_ARBITER
Get-Service MongoDB_RS1, MongoDB_RS2, MongoDB_RS3, MongoDB_ARBITER
