USE mysql;
SHOW TABLES;

/* Perintah DCL - GRANT dan REVOKE */

SELECT USER, HOST, PASSWORD FROM USER

CREATE USER 'user_admin'@'localhost';
CREATE USER 'user_supervisor' IDENTIFIED BY 'supervisor1';
CREATE USER 'user_kasir'@'127.0.0.1' IDENTIFIED BY 'kasir1';

DROP USER 'user_admin'@'localhost';
DROP USER 'user_supervisor';
DROP USER 'user_kasir'@'127.0.0.1';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT SELECT ON 24sa11a159_ampu_sport.* TO 'user_admin'@'localhost';

CREATE USER 'kasir1'@'localhost';
GRANT SELECT, INSERT ON	 24sa11a159_ampu_sport.tbpenjualan TO 'kasir1'@'localhost';

CREATE USER 'owner'@'localhost';
GRANT ALL ON 24sa11a159_ampu_sport.* TO 'owner'@'localhost' 

CREATE USER 'member'@'localhost';
GRANT SELECT (nama, harga, stok) ON 24sa11a159_ampu_sport.tbproduk
TO 'member'@'localhost';


SHOW GRANTS FOR kasir1@localhost;
SHOW GRANTS FOR 'kasir1'@'localhost';

SHOW GRANTS FOR MEMBER@localhost;
SHOW GRANTS FOR 'member'@'localhost';

SHOW GRANTS FOR ADMIN@localhost;
SHOW GRANTS FOR 'admin'@'localhost';

SHOW GRANTS FOR OWNER@localhost;
SHOW GRANTS FOR 'owner'@'localhost';


SET PASSWORD FOR 'owner'@'localhost' = PASSWORD('owner123');

REVOKE INSERT ON 24sa11a159_ampu_sport.* FROM 'user_owner'@'localhost';
REVOKE ALL ON 24sa11a159_ampu_sport.* FROM 'user_owner'@'localhost';
REVOKE SELECT ON 24sa11a159_ampu_sport.* FROM 'user_admin'@'localhost';



/* Fungsi Aggregasi */

SELECT COUNT(*) AS 'Jumlah Member' FROM tbmember

SELECT alamat, COUNT(namamember) AS 'Jumlah Member' FROM tbmember
GROUP BY alamat

SELECT SUM(stok) AS 'Total Stok' FROM tbproduk

SELECT idkategori, SUM(stok) AS 'Total Stok' FROM tbproduk
GROUP BY idkategori

SELECT idkategori, SUM(stok) AS 'Total Produk' FROM tbproduk
GROUP BY idkategori HAVING SUM(stok) >= 10 
