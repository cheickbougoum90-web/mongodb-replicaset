// TEST 4 - Lecture distribuée sur les Secondaries.
// Usage : mongosh --port 27017 --file scripts/08-test-read-secondary.js
db.getMongo().setReadPref("secondary");           // les lectures sont routées vers un Secondary
const ecole = db.getSiblingDB("ecole");
printjson(ecole.etudiants.find({ filiere: "Informatique" }).toArray());

// Plan d'exécution (COLLSCAN attendu : aucun index hors _id)
printjson(ecole.etudiants.find().explain("executionStats").executionStats);
