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

CREATE USER 'user_admin'@'localhost' IDENTIFIED BY 'admin';
GRANT SELECT ON 24sa11a159_ampu_sport.* TO 'user_admin'@'localhost';

CREATE USER 'user_kasir'@'localhost' IDENTIFIED BY 'kasir1';
GRANT SELECT ON 24sa11a159_ampu_sport.tbproduk TO 'user_kasir'@'localhost';
GRANT SELECT ON 24sa11a159_ampu_sport.tbmember TO 'user_kasir'@'localhost';

CREATE USER 'user_owner'@'localhost' IDENTIFIED BY 'sila'
GRANT ALL ON 24sa11a159_ampu_sport.* TO 'user_owner'@'localhost' 

CREATE USER 'user_member'@'localhost';
GRANT SELECT (kode, nama, harga, stok) ON 24sa11a159_ampu_sport.tbproduk
TO 'user_member'@'localhost';


SHOW GRANTS FOR user_owner@localhost;
SHOW GRANTS FOR user_admin@localhost;
SHOW GRANTS FOR user_kasir@localhost;
SHOW GRANTS FOR user_member@localhost;

SET PASSWORD FOR user_owner@'localhost' = PASSWORD('owner');
SET PASSWORD FOR user_admin@'localhost' = PASSWORD('admin123');

REVOKE INSERT ON 24sa11a159_ampu_sport.* FROM 'user_owner'@'localhost';
REVOKE ALL ON 24sa11a159_ampu_sport.* FROM 'user_owner'@'localhost';
REVOKE SELECT ON 24sa11a159_ampu_sport.* FROM 'user_admin'@'localhost';



/* Fungsi Aggregasi */

SELECT COUNT(namamember) AS 'Jumlah Member' FROM tbmember

SELECT alamat, COUNT(namamember) AS 'Jumlah Member' FROM tbmember
GROUP BY alamat

SELECT SUM(stok) AS 'Total Stok' FROM tbproduk

SELECT idkategori, SUM(stok) AS 'Total Stok' FROM tbproduk
GROUP BY idkategori

SELECT idkategori, SUM(stok) AS 'Total Produk' FROM tbproduk
GROUP BY idkategori HAVING SUM(stok) >= 60 
