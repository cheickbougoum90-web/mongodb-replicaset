// Jeux de commandes des tests du rapport, à lancer pas à pas dans mongosh.

// --- Test 1 : réplication --------------------------------------------------
// Sur le Primary (mongosh --port 27017) :
use ecole
db.etudiants.insertMany([
  { nom: "Diallo", prenom: "Amadou", filiere: "Informatique", note: 15 },
  { nom: "Ndiaye", prenom: "Fatou",  filiere: "Mathematiques", note: 17 },
  { nom: "Traore", prenom: "Ibrahim", filiere: "Informatique", note: 14 }
]);
// Sur un Secondary (mongosh --port 27018) : autoriser la lecture puis vérifier
//   db.getMongo().setReadPref("primaryPreferred")   // ou rs.secondaryOk() sur les anciennes versions
//   use ecole
//   db.etudiants.find().pretty()

// --- Test 2 : failover (panne du Primary) ---------------------------------
// Sur le Primary : arrêt du processus
//   db.adminCommand({ shutdown: 1 })
// Puis se connecter à un Secondary (mongosh --port 27018) : son invite doit afficher "direct: primary"
//   rs.hello().isWritablePrimary

// --- Test 3 : réintégration d'un nœud -------------------------------------
// Sur le nouveau Primary, pendant que le nœud 27017 est arrêté :
//   use ecole
//   db.etudiants.insertOne({ nom: "Ba", prenom: "Mariama", filiere: "Physique", note: 18 })
// Relancer le nœud 27017 (Start-Service MongoDB_RS1), puis vérifier sur le nœud 27017 :
//   rs.status().members.forEach(m => print(m.name, m.stateStr))
//   db.getMongo().setReadPref("primaryPreferred"); use ecole; db.etudiants.find({ nom: "Ba" })
