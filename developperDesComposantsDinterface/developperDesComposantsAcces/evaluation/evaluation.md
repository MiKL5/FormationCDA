**Requêtes d'intérrogation**

01. Liste des contacts français :
```sql
SELECT CompanyName Société, ContactName Contact, ContactTitle Fonction, Phone Téléphone
FROM customers
WHERE Country
LIKE 'France';
```

02. Produits vendus par le fournisseur « Exotic Liquids » :
```sql
SELECT productName produit, unitPrice prix
FROM products
WHERE supplierID = 1;
```
03. Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
```sql
SELECT CompanyName Fournisseur, SUM(UnitsInStock) nb_products
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID
WHERE Country = 'France'
GROUP BY Fournisseur
ORDER BY nb_products DESC;
```
04. Liste des clients Français ayant plus de 10 commandes :
```sql
SELECT CompanyName, COUNT(OrderDate) AS nb_cmdes
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
SELECT SUM(UnitPrice * Quantity) AS `Montant Ventes 97`
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
WHERE YEAR(OrderDate) LIKE "1997";
```
08. Montant des ventes de 1997 mois par mois :
```sql

```
