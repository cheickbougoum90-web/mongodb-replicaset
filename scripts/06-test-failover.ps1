# TEST 2 - Panne du Primary : on arrête le nœud 1 puis on observe l'élection sur le nœud 2.
Write-Host "Arrêt du Primary (MongoDB_RS1)..." -ForegroundColor Yellow
Stop-Service MongoDB_RS1

Write-Host "Attente de l'élection (10 à 30 s)..."
Start-Sleep -Seconds 30

# db.hello() est utilisé plutôt que rs.status() : avec un membre arrêté, rs.status() a retourné
# 'BSONError: Invalid UTF-8 string in BSON document' lors de nos essais sous Windows.
mongosh --port 27018 --quiet --eval "const h = db.hello(); print('Primary actuel :', h.primary); print('Ce nœud est Primary ?', h.isWritablePrimary)"
