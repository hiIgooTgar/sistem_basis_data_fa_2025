SET autocommit = 0;
START TRANSACTION;
INSERT INTO tbpenjualan VALUES(1106, '2026-1-10', 2, 'M05', 3600000);
INSERT INTO tbdetailjual VALUES(1106, 'KPD06', 1, 1200000, jml*harga);
UPDATE tbproduk SET stok = stok - 1 WHERE kode = 'KPD06';
COMMIT;



SET autocommit = 0;
START TRANSACTION;
INSERT INTO tbmember VALUES('M06', 'Andi Lukman', 'Purbalingga', '0884636463431');
ROLLBACK;


SET autocommit = 0;
START TRANSACTION;
UPDATE tbmember SET namamember = 'Indah Permatasari' WHERE idmember = 'M05';
SAVEPOINT a;
INSERT INTO tbmember VALUES('M07', 'Lucky Putra', 'Banyumas', '0856743645365'); 
SAVEPOINT b;
INSERT INTO tbmember VALUES('M08', 'Marry Osvaldona', 'Jakarta', '0814834173734');
ROLLBACK TO b; 
ROLLBACK TO a;




CREATE USER 'user_admin'@'localhost';
GRANT ALL ON 24sa11a159_ampu_sport.* TO 'user_admin'@'localhost';

SHOW GRANTS FOR 'user_admin'@'localhost';



LOCK TABLE tbkategori READ;
LOCK TABLE tbproduk READ;
UNLOCK TABLE;


LOCK TABLE tbkategori WRITE;
LOCK TABLE tbproduk WRITE;
UNLOCK TABLE;




START TRANSACTION;
SELECT * FROM tbproduk WHERE kode = "KPD05" LOCK IN SHARE MODE;



START TRANSACTION;
SELECT * FROM tbproduk WHERE kode = "KPD05" FOR UPDATE;




-- Deadlock
-- No. 1 user root
UPDATE tbproduk SET stok = stok + 5 WHERE kode = "KPD01";

-- No. 2 user admin
UPDATE tbproduk SET harga = harga + 1 WHERE kode = "KPD02";

-- No. 3 user root
UPDATE tbproduk SET stok = stok + 10 WHERE kode = "KPD02";

-- No. 4 user admin
UPDATE tbproduk SET harga = harga + 2 WHERE kode = "KPD01";






-- Code di user admin : Tabel Kategori dan Tabel Produk

-- Tabel Kategori INSERT, UDPATE, DELETE and SELECT
INSERT INTO tbkategori(idkategori, nama_kategori) VALUES('K11', 'Peralatan GYM');

UPDATE tbkategori SET nama_kategori = 'Peralatan Padel' WHERE idkategori = 'K11';

DELETE FROM tbkategori WHERE idkategori = 'K11';

SELECT * FROM tbkategori;



-- Tabel Produk INSERT, UDPATE, DELETE and SELECT
INSERT INTO tbproduk(kode, nama, idkategori, harga, stok) VALUES
("KPD07", "Sarung Tangan Kiper Serias World Cup", "K02", 600000, 100);

UPDATE tbproduk SET nama = 'Sarung Tangan Kiper Serias SEA Games' WHERE kode = 'KPD07';

DELETE FROM tbproduk WHERE kode = 'KPD07';

SELECT * FROM tbproduk;






