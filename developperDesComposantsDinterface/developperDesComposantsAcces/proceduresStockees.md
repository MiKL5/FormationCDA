```sql

Ex1_création d une procédure stockées sans paramètre

DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT DISTINCT numfou
    FROM entcom;
END |

DELIMITER |

CALL Lst_fournis;




```