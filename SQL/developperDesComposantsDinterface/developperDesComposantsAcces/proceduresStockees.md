## Ex1 : **création d'une procédure stockées sans paramètre**

>- Créez la procédure stockée Lst_fournis correspondant à la requête n°2 afficher le code des fournisseurs pour lesquels une commande a été passée.
>- Exécutez la pour vérifier qu’elle fonctionne conformément à votre attente.
>- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :

```sql
DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT DISTINCT fournis.numfou
    FROM entcom
    JOIN fournis ON entcom.numfou = fournis.numfou;
END |
CALL `Lst_fournis`;

DELIMITER ;
```

## Ex2 : **création d'une procédure stockée avec un paramètre en entrée**

>Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom.

```sql
DELIMITER |

CREATE OR REPLACE PROCEDURE Lst_Commandes()
BEGIN
    SELECT entcom.numcom, nomfou, libart, (qtecde*priuni) AS sous_total FROM entcom
    JOIN fournis ON entcom.numfou = fournis.numfou
    JOIN ligcom ON entcom.numcom = ligcom.numcom
    JOIN produit ON ligcom.codart = produit.codart
    WHERE obscom LIKE CONCAT('%', obscom, '%');
END |

DELIMITER ;

```