SQL
CREATE TABLE produit(
   Id_produit INT AUTO_INCREMENT,
   libelle VARCHAR(50) ,
   caracteristiques VARCHAR(100) ,
   prix DECIMAL(19,4),
   quantite DECIMAL(3,0)  ,
   stock_alerte DECIMAL(2,0)  ,
   date_aprovisionnement DATETIME,
   PRIMARY KEY(Id_produit)
);

CREATE TABLE panier(
   Id_panier INT AUTO_INCREMENT,
   PRIMARY KEY(Id_panier)
);

CREATE TABLE utilisateur(
   Id_utilisateur INT AUTO_INCREMENT,
   nom VARCHAR(50) ,
   prenom VARCHAR(50) ,
   email VARCHAR(100) ,
   PRIMARY KEY(Id_utilisateur)
);

CREATE TABLE fournisseur(
   Id_fournisseur INT AUTO_INCREMENT,
   raison_sociale VARCHAR(50) ,
   contact VARCHAR(125) ,
   adresse VARCHAR(50) ,
   code_postal DECIMAL(6,0)  ,
   ville VARCHAR(50) ,
   telephone DECIMAL(14,0)  ,
   PRIMARY KEY(Id_fournisseur)
);

CREATE TABLE client(
   Id_client INT AUTO_INCREMENT,
   nom VARCHAR(50) ,
   prenom VARCHAR(50) ,
   email VARCHAR(100) ,
   adress VARCHAR(100) ,
   codepostal DECIMAL(6,0)  ,
   ville VARCHAR(50) ,
   telephone DECIMAL(14,0)  ,
   PRIMARY KEY(Id_client)
);

CREATE TABLE commande_fournisseur(
   Id_utilisateur INT,
   date_achat DATETIME,
   montant_ht DECIMAL(19,4),
   montant_tva DECIMAL(19,4),
   date_livraison DATETIME,
   Id_fournisseur INT NOT NULL,
   PRIMARY KEY(Id_utilisateur),
   FOREIGN KEY(Id_utilisateur) REFERENCES utilisateur(Id_utilisateur),
   FOREIGN KEY(Id_fournisseur) REFERENCES fournisseur(Id_fournisseur)
);

CREATE TABLE achemine(
   Id_produit INT,
   Id_fournisseur INT,
   PRIMARY KEY(Id_produit, Id_fournisseur),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_fournisseur) REFERENCES fournisseur(Id_fournisseur)
);

CREATE TABLE achete(
   Id_produit INT,
   Id_client INT,
   PRIMARY KEY(Id_produit, Id_client),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client)
);

CREATE TABLE commande_client(
   Id_panier INT,
   Id_client INT,
   date_achat DATETIME,
   montant_ht DECIMAL(19,4),
   montant_tva DECIMAL(19,4),
   date_livraison DATETIME,
   PRIMARY KEY(Id_panier, Id_client),
   FOREIGN KEY(Id_panier) REFERENCES panier(Id_panier),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client)
);


MLD
produit = (Id_produit INT AUTO_INCREMENT, libelle VARCHAR(50) , caracteristiques VARCHAR(100) , prix DECIMAL(19,4), quantite DECIMAL(3,0)  , stock_alerte DECIMAL(2,0)  , date_aprovisionnement DATETIME);
panier = (Id_panier INT AUTO_INCREMENT);
utilisateur = (Id_utilisateur INT AUTO_INCREMENT, nom VARCHAR(50) , prenom VARCHAR(50) , email VARCHAR(100) );
fournisseur = (Id_fournisseur INT AUTO_INCREMENT, raison_sociale VARCHAR(50) , contact VARCHAR(125) , adresse VARCHAR(50) , code_postal DECIMAL(6,0)  , ville VARCHAR(50) , telephone DECIMAL(14,0)  );
client = (Id_client INT AUTO_INCREMENT, nom VARCHAR(50) , prenom VARCHAR(50) , email VARCHAR(100) , adress VARCHAR(100) , codepostal DECIMAL(6,0)  , ville VARCHAR(50) , telephone DECIMAL(14,0)  );
commande_fournisseur = (#Id_utilisateur, date_achat DATETIME, montant_ht DECIMAL(19,4), montant_tva DECIMAL(19,4), date_livraison DATETIME, #Id_fournisseur);
achemine = (#Id_produit, #Id_fournisseur);
achete = (#Id_produit, #Id_client);
commande_client = (#Id_panier, #Id_client, date_achat DATETIME, montant_ht DECIMAL(19,4), montant_tva DECIMAL(19,4), date_livraison DATETIME);
