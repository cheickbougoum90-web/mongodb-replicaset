# TEST 3 - Réintégration : écriture pendant l'absence du nœud 1, puis relance du nœud 1.
Write-Host "1) Insertion sur le nouveau Primary (27018) pendant que le nœud 1 est éteint"
mongosh --port 27018 --quiet --eval "printjson(db.getSiblingDB('ecole').etudiants.insertOne({ nom: 'Ba', prenom: 'Mariama', filiere: 'Physique', note: 18 }))"

Write-Host "2) Relance du nœud 1" -ForegroundColor Yellow
Start-Service MongoDB_RS1
Start-Sleep -Seconds 20

Write-Host "3) Le nœud 1 s'est-il resynchronisé ? (lecture autorisée sur le Secondary)"
mongosh --port 27017 --quiet --eval "db.getMongo().setReadPref('primaryPreferred'); printjson(db.getSiblingDB('ecole').etudiants.find().toArray()); print('Primary :', db.hello().primary)"
