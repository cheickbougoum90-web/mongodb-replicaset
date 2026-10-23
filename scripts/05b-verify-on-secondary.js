// TEST 1 - étape 2 : vérifier la réplication sur un Secondary.
// Usage : mongosh --port 27018 --file scripts/05b-verify-on-secondary.js
// (rs.secondaryOk() est déprécié : on autorise la lecture via la read preference)
db.getMongo().setReadPref("primaryPreferred");
printjson(db.getSiblingDB("ecole").etudiants.find().toArray());
