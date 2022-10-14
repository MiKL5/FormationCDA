## Ex1 : **création d'une procédure stockées sans paramètre**

>- Créez la procédure stockée Lst_fournis correspondant à la requête n°2 afficher le code des fournisseurs pour lesquels une commande a été passée.
>- Exécutez la pour vérifier qu’elle fonctionne conformément à votre attente.
>- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :

```sql
DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT DISTINCT numfou
    FROM entcom;
END |

DELIMITER |

CALL Lst_fournis;
```

## Ex2 : **création d'une procédure stockée avec un paramètre en entrée**

>Créer la procédure stockée Lst_Commandes, qui liste les commandes ayant un libellé particulier dans le champ obscom (cette requête sera construite à partir de la requête n°11).

```sql

```