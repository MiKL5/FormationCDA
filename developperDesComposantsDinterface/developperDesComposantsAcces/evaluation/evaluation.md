1) Requêtes d'intérrogation sur la base NorthWind

01. Liste des contacts français :
```sql

SELECT CompanyName AS Société, ContactName AS Contact, ContactTitle AS Fonction, Phone AS Téléphone
FROM customers
WHERE Country
LIKE 'France';

```

02. Produits vendus par le fournisseur « Exotic Liquids » :
```sql

SELECT productName, unitPrice
FROM products
WHERE supplierID = 1;

```
03. Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
```sql



```