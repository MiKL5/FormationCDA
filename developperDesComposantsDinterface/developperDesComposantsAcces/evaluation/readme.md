# *Évaluation :* ***cas Northwind***

## **1) Requêtes d'intérrogation**

01. Liste des contacts français :
```sql
SELECT CompanyName Société, ContactName Contact, ContactTitle Fonction, Phone Num_de_téléphone
FROM customers
WHERE Country
LIKE 'France';
```

02. Produits vendus par le fournisseur « Exotic Liquids » :
```sql
SELECT productName Produit, unitPrice Prix
FROM products
WHERE supplierID = 1;
```
03. Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
```sql
SELECT CompanyName Fournisseur, SUM(UnitsInStock) Nbre_de_produits
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID
WHERE Country = 'France'
GROUP BY Fournisseur
ORDER BY nb_products DESC;
```
04. Liste des clients Français ayant plus de 10 commandes :
```sql
SELECT CompanyName AS Clients, COUNT(OrderDate) AS Nbres_de_cmdes
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE Country = "France" 
GROUP BY CompanyName
HAVING COUNT(OrderDate) > 10
```
05. Liste des clients ayant un chiffre d’affaires > 30.000 :
```sql
SELECT CompanyName Client, SUM(`order details`.unitPrice * `order details`.Quantity) CA, Country Pays
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN `order details` ON orders.OrderID = `order details`.OrderID 
GROUP BY CompanyName 
HAVING CA > 30000
ORDER BY CA DESC;
```
06. Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » :
```sql
SELECT customers.Country AS Pays
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON products.ProductID = `order details`.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.companyName = 'Exotic Liquids'
GROUP BY customers.Country ASC;
```
07. Montant des ventes de 1997 :
```sql
SELECT SUM(UnitPrice * Quantity) AS `Montant_des_ventes_1997`
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
WHERE YEAR(OrderDate) LIKE "1997";
```
08. Montant des ventes de 1997 mois par mois :
```sql
SELECT DISTINCT MONTH(OrderDate) AS Mois_de_1997, ROUND(SUM(`order details`.UnitPrice*`order details`.Quantity),2) AS `Montant_des_ventes_de_1997`
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
WHERE YEAR(OrderDate) IN (1997)
GROUP BY MONTH(OrderDate);
```
09. Depuis quelle date le client « Du monde entier » n’a plus commandé ?
```sql
SELECT MAX(DATE(OrderDate)) AS Date_de_dernière_commande
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE CompanyName LIKE 'Du monde entier';
```
10. Montant des ventes de 1997 mois par mois :
```sql
SELECT ROUND(AVG(DATEDIFF(ShippedDate,OrderDate))) AS ̀Delai_moyen_de_livraison_en_jours
FROM orders;
```

## **2) Procédures stockées**
01. Créer la procédure stockée CA_ Fournisseur  
### *Procédure correspondant à la neuveième requête*
```sql
DELIMITER |
CREATE PROCEDURE CmdeDuMondeEntier()
BEGIN
    SELECT MAX(DATE(OrderDate)) AS Date_de_dernière_commande
    FROM customers
    JOIN orders ON customers.CustomerID = orders.CustomerID
    WHERE CompanyName LIKE 'Du monde entier';
END |
DELIMITER ;

CALL CmdeDuMondeEntier()
```
<!-- mettre un ; aprés END si je test avec l'extention mysql -->

```sql
DELIMITER |
CREATE PROCEDURE MontantDesVentes97ParMois()
BEGIN
    SELECT ROUND(AVG(DATEDIFF(ShippedDate,OrderDate))) AS ̀Delai_moyen_de_livraison_en_jours
    FROM orders;
END |
DELIMITER ;


CALL CmdeDuMondeEntier()

```
<!-- Ne pas oublier les parenthèses à la création -->
## 3) **Mise en place d'une règle de gestion**
```sql

```