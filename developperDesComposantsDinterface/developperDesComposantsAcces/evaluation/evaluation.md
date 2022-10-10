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
SELECT ContactName Clients, shippedDate Nbre commandes
FROM customers
JOIN orders
WHERE 

```