// TEST 1 - étape 1 : insérer des données sur le Primary.
// Usage : mongosh --port 27017 --file scripts/05a-insert-on-primary.js
const ecole = db.getSiblingDB("ecole");
printjson(ecole.etudiants.insertMany([
  { nom: "Diallo", prenom: "Amadou", filiere: "Informatique",  note: 15 },
  { nom: "Ndiaye", prenom: "Fatou",  filiere: "Mathematiques", note: 17 },
  { nom: "Traore", prenom: "Ibrahim", filiere: "Informatique", note: 14 }
]));
