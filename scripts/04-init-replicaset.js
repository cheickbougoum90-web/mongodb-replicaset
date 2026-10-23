// Initialise le ReplicaSet "rs0" (3 membres, le nœud 1 a la priorité la plus haute).
// Usage : mongosh --port 27017 --file scripts/04-init-replicaset.js
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "localhost:27017", priority: 2 },
    { _id: 1, host: "localhost:27018", priority: 1 },
    { _id: 2, host: "localhost:27019", priority: 1 }
  ]
});

// Optionnel : ajouter l'arbitre (nœud sans données, vote seulement).
// À exécuter sur le Primary une fois celui-ci élu :
// rs.addArb("localhost:27020");

print("Vérification : mongosh --port 27017 --eval \"rs.status().members.forEach(m => print(m.name, m.stateStr))\"");
