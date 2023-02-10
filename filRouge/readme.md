# **Green Music**


[Dicitonnaire de données](dictionnaireDeDonnées.xlsx "Cliquez ici pour accéder au fichier")

Le shéma de la base de données
![shéma](greenMusic_v2.png)

La base de données
```sql
DROP DATABASE IF EXISTS greenMusic;
CREATE DATABASE greenMusic;
USE greenMusic;

CREATE TABLE cart(
   id_cart INT AUTO_INCREMENT,
   PRIMARY KEY(id_cart)
);

CREATE TABLE utilisateur(
   Id_utilisateur INT AUTO_INCREMENT,
   name VARCHAR(50) ,
   firstname VARCHAR(50) ,
   email VARCHAR(100) ,
   role VARCHAR(25) ,
   zipcode DECIMAL(6,0)  ,
   adress VARCHAR(100) ,
   city VARCHAR(50) ,
   phonenumber DECIMAL(14,0)  ,
   password VARCHAR(255) ,
   is_verified BOOLEAN,
   PRIMARY KEY(Id_utilisateur)
);

CREATE TABLE suplier(
   id_supplider INT AUTO_INCREMENT,
   company_name VARCHAR(50) ,
   contact VARCHAR(125) ,
   adress VARCHAR(50) ,
   zipcode DECIMAL(6,0)  ,
   ville DOUBLE,
   phone_number DECIMAL(14,0)  ,
   PRIMARY KEY(id_supplider)
);

CREATE TABLE Commande(
   Id_Commande INT AUTO_INCREMENT,
   status VARCHAR(20) ,
   montant_vat DECIMAL(19,4),
   purchase_date DATETIME,
   order_date DATETIME,
   montant_ht DECIMAL(19,4),
   delivery_date DATETIME,
   invoice_date DATETIME,
   billing_adress VARCHAR(100) ,
   billing_zipcode DECIMAL(6,0)  ,
   billing_city VARCHAR(50) ,
   delivery_adress VARCHAR(100) ,
   delivery_zipcode DECIMAL(6,0)  ,
   delivery_city VARCHAR(50) ,
   Id_utilisateur INT NOT NULL,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_utilisateur) REFERENCES utilisateur(Id_utilisateur)
);

CREATE TABLE category(
   Id_category INT AUTO_INCREMENT,
   parent_category INT AUTO_INCREMENT,
   PRIMARY KEY(Id_category, parent_category)
);

CREATE TABLE product(
   Id_produit INT AUTO_INCREMENT,
   wording VARCHAR(50) ,
   features VARCHAR(100) ,
   information VARCHAR(100) ,
   price DECIMAL(19,4),
   quantity DECIMAL(3,0)  ,
   alerte_stock DECIMAL(2,0)  ,
   supply_date DATETIME,
   picture VARCHAR(200) ,
   Id_category INT NOT NULL,
   parent_category INT NOT NULL,
   PRIMARY KEY(Id_produit),
   FOREIGN KEY(Id_category, parent_category) REFERENCES category(Id_category, parent_category)
);

CREATE TABLE send(
   Id_produit INT,
   id_supplider INT,
   PRIMARY KEY(Id_produit, id_supplider),
   FOREIGN KEY(Id_produit) REFERENCES product(Id_produit),
   FOREIGN KEY(id_supplider) REFERENCES suplier(id_supplider)
);

CREATE TABLE is_ordered(
   Id_produit INT,
   Id_Commande INT,
   quantite INT,
   prix_vente DECIMAL(19,4),
   PRIMARY KEY(Id_produit, Id_Commande),
   FOREIGN KEY(Id_produit) REFERENCES product(Id_produit),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE is_sold(
   id_cart INT,
   Id_Commande INT,
   PRIMARY KEY(id_cart, Id_Commande),
   FOREIGN KEY(id_cart) REFERENCES cart(id_cart),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);
```

Le MLD
```SQL
cart = (id_cart INT AUTO_INCREMENT);
utilisateur = (Id_utilisateur INT AUTO_INCREMENT, name VARCHAR(50) , firstname VARCHAR(50) , email VARCHAR(100) , role VARCHAR(25) , zipcode DECIMAL(6,0)  , adress VARCHAR(100) , city VARCHAR(50) , phonenumber DECIMAL(14,0)  , password VARCHAR(255) , is_verified BOOLEAN);
suplier = (id_supplider INT AUTO_INCREMENT, company_name VARCHAR(50) , contact VARCHAR(125) , adress VARCHAR(50) , zipcode DECIMAL(6,0)  , ville DOUBLE, phone_number DECIMAL(14,0)  );
Commande = (Id_Commande INT AUTO_INCREMENT, status VARCHAR(20) , montant_vat DECIMAL(19,4), purchase_date DATETIME, order_date DATETIME, montant_ht DECIMAL(19,4), delivery_date DATETIME, invoice_date DATETIME, billing_adress VARCHAR(100) , billing_zipcode DECIMAL(6,0)  , billing_city VARCHAR(50) , delivery_adress VARCHAR(100) , delivery_zipcode DECIMAL(6,0)  , delivery_city VARCHAR(50) , #Id_utilisateur);
category = (Id_category INT AUTO_INCREMENT, parent_category INT AUTO_INCREMENT);
product = (Id_produit INT AUTO_INCREMENT, wording VARCHAR(50) , features VARCHAR(100) , information VARCHAR(100) , price DECIMAL(19,4), quantity DECIMAL(3,0)  , alerte_stock DECIMAL(2,0)  , supply_date DATETIME, picture VARCHAR(200) , #(Id_category, parent_category));
send = (#Id_produit, #id_supplider);
is_ordered = (#Id_produit, #Id_Commande, quantite INT, prix_vente DECIMAL(19,4));
is_sold = (#id_cart, #Id_Commande);
```
[La maquette](maquette.pdf)