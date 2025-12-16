-- Trigger AFTER INSERT
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_jual 
AFTER INSERT ON tbdetailjual
FOR EACH ROW 
BEGIN
	UPDATE tbproduk SET stok = stok - New.jml
	WHERE kode = New.kode;
END $$

INSERT INTO tbpenjualan(nota, tgltransaksi, id, idmember, total) VALUES
(1106, '2025-12-9', 1, 'M03', 1600000),
(1107, '2025-12-10', 2, 'M05', 1600000);

INSERT INTO tbdetailjual(nota, kode, jml, harga, subtotal) VALUES
(1106, 'KPD05', 5, 500000, 2500000),
(1107, 'KPD07', 3, 800000, 2400000);




-- Trigger BEFORE INSERT
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_cekharga 
AFTER INSERT ON tbproduk
FOR EACH ROW 
BEGIN
	IF NEW.harga <= 300000 THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Harga tidak sesuai ketentuan. Cek kembali harga produk!";
	END IF;
END $$

INSERT INTO tbproduk(kode, nama, idkategori, harga, stok) VALUES(
'KPD08', 'Pakaian Renang Wowan', 'K09', 250000, 100);



-- Trigger BEFORE UPDATE
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_updateharga 
BEFORE UPDATE ON tbproduk
FOR EACH ROW 
BEGIN
	IF NEW.harga <= 280000 THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Harga tidak sesuai ketentuan. Cek kembali harga produk!";
	END IF;
END $$

UPDATE tbproduk SET harga = 250000 WHERE kode = "KPD07";



-- Trigger BEFORE DELETE
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_hapuspemasok 
BEFORE DELETE ON tbpemasok
FOR EACH ROW
BEGIN
	IF OLD.idpemasok = OLD.idpemasok THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Data pemasok tidak dapat dihapus!";
	END IF;
END $$

DELETE FROM tbpemasok WHERE idpemasok = "ISP01";



-- Trigger AFTER DELETE
DELIMITER $$
CREATE OR REPLACE TRIGGER tr_hapuspenjualan 
AFTER DELETE ON tbpenjualan
FOR EACH ROW
BEGIN
	DELETE FROM tbdetailjual WHERE nota = OLD.nota;
END $$

DELETE FROM tbpenjualan WHERE nota = 1105;



-- Soal Praktikum 9 - Trigger


-- Tugas No. 1 bisa di run ketika trigger bernama trig_jual nya dihapus, karena fungsi trigger nya kurang lebih sama
--  hanya beda di -/+ saja... dan pengguna tabelnya juga sama yaitu tbpenjualan dan tbdetailbeli dan sebaliknya jika trig_jual akan digunakan

-- No. 1 Trigger AFTER INSERT
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_penjualan_add 
AFTER INSERT ON tbdetailjual
FOR EACH ROW 
BEGIN
	UPDATE tbproduk SET stok = stok + New.jml
	WHERE kode = New.kode;
END $$

INSERT INTO tbpenjualan(nota, tgltransaksi, id, idmember, total) VALUES
(1108, '2025-12-9', 1, 'M03', 1600000),
(1109, '2025-12-10', 2, 'M05', 1600000);

INSERT INTO tbdetailjual(nota, kode, jml, harga, subtotal) VALUES
(1108, 'KPD05', 10, 500000, 5000000),
(1109, 'KPD07', 5, 800000, 4000000);


-- No. 2 Trigger BEFORE INSERT
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_pengguna_sandi_insert
BEFORE INSERT ON tbpengguna
FOR EACH ROW 
BEGIN
	DECLARE sandi_same INT DEFAULT 0;
	SELECT COUNT(*) INTO sandi_same FROM tbpengguna WHERE sandi = NEW.sandi;
	
	IF sandi_same > 0 THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Sandi sudah digunakan! harap sandi yang lain";
	END IF;
END $$

INSERT INTO tbpengguna(username, sandi, jabatan, nama) VALUES(
'kasir3', 'kasir321', 'kasir', 'Putri Ayu Tyas')



-- No. 3 Trigger BEFORE UPDATE
DELIMITER $$
CREATE OR REPLACE TRIGGER trig_pengguna_sandi_update
BEFORE UPDATE ON tbpengguna
FOR EACH ROW 
BEGIN
    DECLARE sandi_same INT DEFAULT 0;    
    IF OLD.sandi <> NEW.sandi THEN 
        SELECT COUNT(*) INTO sandi_same FROM tbpengguna WHERE sandi = NEW.sandi AND username <> OLD.username;
	IF sandi_same > 0 THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Sandi sudah digunakan! harap sandi yang lain";
	END IF;
     END IF;
END $$

UPDATE tbpengguna SET sandi = 'admin123' WHERE username = 'admin2';



-- No. 4 Trigger BEFORE DELETE 
DELIMITER $$
CREATE OR REPLACE TRIGGER tr_hapusmember
BEFORE DELETE ON tbmember
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'Penghapusan data member diblokir! Data master tidak boleh dihapus.';
END $$

DELETE FROM tbmember WHERE idmember = "M05";


-- atau

DELIMITER $$
CREATE OR REPLACE TRIGGER tr_hapusmember 
BEFORE DELETE ON tbmember
FOR EACH ROW
BEGIN
	IF OLD.idmember = OLD.idmember THEN
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = "Penghapusan data member diblokir! Data master tidak boleh dihapus.";
	END IF;
END $$

DELETE FROM tbmember WHERE idmember = "M05";



DROP TRIGGER tr_hapusmember;
DROP TRIGGER tr_hapuspenjualan;
DROP TRIGGER trig_cekharga;
DROP TRIGGER trig_hapuspemasok;
DROP TRIGGER trig_jual;
DROP TRIGGER trig_pengguna;
DROP TRIGGER trig_pengguna_sandi_update;
DROP TRIGGER trig_penjualan_add;
DROP TRIGGER trig_updateharga;

DELETE FROM tbpenjualan WHERE nota = 1106;
DELETE FROM tbpenjualan WHERE nota = 1107;
DELETE FROM tbpenjualan WHERE nota = 1108;
DELETE FROM tbpenjualan WHERE nota = 1109;
DELETE FROM tbpenjualan WHERE nota = 11010;

DELETE FROM tbdetailjual WHERE nota = 1106;
DELETE FROM tbdetailjual WHERE nota = 1107;
DELETE FROM tbdetailjual WHERE nota = 1108;
DELETE FROM tbdetailjual WHERE nota = 1109;
DELETE FROM tbdetailjual WHERE nota = 1110;




-- Membuat Log Tabel Produk Harga Lama dan Harga Baru
CREATE TABLE tblog_produk (
 id_log INT AUTO_INCREMENT PRIMARY KEY,
 kode VARCHAR(15),
 harga_lama INT,
 harga_baru INT,
 waktu DATETIME 
)

DELIMITER $$
CREATE OR REPLACE TRIGGER tr_update_hargaproduk AFTER UPDATE ON tbproduk
FOR EACH ROW 
BEGIN 
	INSERT INTO tblog_produk (kode, harga_lama, harga_baru, waktu)
        VALUES (OLD.kode, OLD.harga, NEW.harga, NOW());
END $$

UPDATE tbproduk SET harga = 300000 WHERE kode = "KPD07";
SELECT * FROM tbproduk;