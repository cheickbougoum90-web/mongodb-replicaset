// Initialisation du ReplicaSet rs0 : à lancer avec  mongosh --port 27017 --file 02_initialisation_replicaset.js
// Le nœud 27017 a la priorité la plus haute (2) : il devient Primary en temps normal.
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "localhost:27017", priority: 2 },
    { _id: 1, host: "localhost:27018", priority: 1 },
    { _id: 2, host: "localhost:27019", priority: 1 }
  ]
});

// Vérification : stateStr de chaque membre (PRIMARY, SECONDARY), santé et optime
rs.status().members.forEach(m => print(m.name, m.stateStr, "health =", m.health));
