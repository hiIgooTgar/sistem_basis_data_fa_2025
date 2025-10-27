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


SHOW GRANTS FOR 'kasir1'@'localhost';
SHOW GRANTS FOR 'member'@'localhost';
SHOW GRANTS FOR 'admin'@'localhost';
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



/* Tugas Praktikum 5*/
-- No Tugas 1
CREATE USER 'igo_tegar'@'localhost' IDENTIFIED BY '24sa11a159';

-- No Tugas 2
-- Cara 1
GRANT SELECT ON	24sa11a159_ampu_sport.tbpenjualan TO 'igo_tegar'@'localhost';
GRANT UPDATE (stok) ON 24sa11a159_ampu_sport.tbproduk TO 'igo_tegar'@'localhost';
-- Cara 2
GRANT SELECT, UPDATE (stok) ON 24sa11a159_ampu_sport.tbproduk TO 'igo_tegar'@'localhost';

-- a. Melihat data produk dan penjualan
GRANT SELECT ON	24sa11a159_ampu_sport.tbproduk TO 'igo_tegar'@'localhost';
GRANT SELECT ON	24sa11a159_ampu_sport.tbpenjualan TO 'igo_tegar'@'localhost';

-- b Update stok pada tabel produk
GRANT UPDATE (stok) ON 24sa11a159_ampu_sport.tbproduk TO 'igo_tegar'@'localhost';

-- c. Menambahkan data penjualan dan pembelian
GRANT INSERT ON 24sa11a159_ampu_sport.tbpenjualan TO 'igo_tegar'@'localhost';
GRANT INSERT ON 24sa11a159_ampu_sport.tbpembelian TO 'igo_tegar'@'localhost';

REVOKE SELECT, UPDATE (stok) ON 24sa11a159_ampu_sport.tbproduk FROM 'igo_tegar'@'localhost';
DROP USER 'igo_tegar'@'localhost'
SHOW GRANTS FOR 'igo_tegar'@'localhost'

-- No Tugas 3
CREATE USER 'supervisor'@'localhost';
GRANT ALL ON 24sa11a159_ampu_sport.* TO 'supervisor'@'localhost';

-- No Tugas 4
SELECT kode, nama, harga FROM tbproduk WHERE harga = (SELECT MAX(harga) FROM tbproduk)
UNION
SELECT kode, nama, harga FROM tbproduk WHERE harga = (SELECT MIN(harga) FROM tbproduk);

-- No Tugas 5
SELECT idkategori, AVG(harga) AS "Rata Rata Harga Produk" FROM tbproduk GROUP BY idkategori;

-- No Tugas 6
SELECT idpemasok, SUM(totalbeli) AS total_nilai_pembelian FROM tbpembelian GROUP BY idpemasok
ORDER BY total_nilai_pembelian DESC;

-- No Tugas 7
SELECT tgltransaksi, SUM(total) AS total_penjualan
FROM tbpenjualan GROUP BY tgltransaksi ORDER BY tgltransaksi ASC;

-- No Tugas 8
SELECT idmember, COUNT(nota) AS jumlah_transaksi
FROM tbpenjualan GROUP BY idmember;

-- No Tugas 9
SELECT idpemasok, SUM(totalbeli) AS total_pembelian
FROM tbpembelian GROUP BY idpemasok;

