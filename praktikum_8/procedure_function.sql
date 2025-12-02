-- Query procedure untuk menambah data kategori --
DELIMITER ||
CREATE OR REPLACE PROCEDURE tambahKategori(IN id VARCHAR(10), IN nama VARCHAR(50))
BEGIN 
	INSERT INTO tbkategori(idkategori, nama_kategori) VALUES (id, nama);
END ||

CALL tambahKategori("K11", "Peratalatan Panjat Tebing");


-- Query procedure untuk mengubah data kategori --
DELIMITER ||
CREATE OR REPLACE PROCEDURE ubahKategori(IN id VARCHAR(10), IN nama VARCHAR(50))
BEGIN 
	UPDATE tbkategori SET nama_kategori = nama WHERE idkategori = id;
END ||

CALL ubahKategori("K11", "Peratalatan Lempar Lembing");




-- Query procedure untuk menghapus data kategori
DELIMITER ||
CREATE OR REPLACE PROCEDURE hapusKategori(IN id VARCHAR(10))
BEGIN
	DELETE FROM tbkategori WHERE idkategori = id;
END ||

CALL hapusKategori('K11');




-- Query procedure dengan parameter OUT --
DELIMITER ||
CREATE OR REPLACE PROCEDURE jumlahKategori(OUT hasil INT)
BEGIN 
	SELECT COUNT(*) INTO hasil FROM tbkategori;
END ||

CALL jumlahKategori(@jml);
SELECT @jml AS "Jumlah Data Kategori";






-- Query procedure dengan parameter IN OUT (menampilkan jml member berdasarkan alamat tertentu) -- 
DELIMITER $$
CREATE OR REPLACE PROCEDURE jumlahMember(IN alamat_member VARCHAR(50), OUT hasil INT)
BEGIN 
	SELECT COUNT(*) INTO hasil FROM tbmember WHERE alamat = alamat_member;
END $$

CALL jumlahMember('Purwokerto', @jumlah);
SELECT @jumlah AS "Jumlah Member dari Purwokerto";





-- Query function bawaan MySQL

-- Queri implementasi fungsi string
SELECT namamember, LEFT(namamember,5), RIGHT(namamember,5) FROM tbmember;

-- Queri implementasi fungsi tanggal dan waktu
SELECT tgltransaksi, DATEDIFF(NOW(), tgltransaksi) FROM tbpenjualan WHERE nota = 1102;
SELECT tgltransaksi, MONTHNAME(tgltransaksi) FROM tbpenjualan;






-- QueryUser Define Function (menampilkan jumlah stok produk) -- 
DELIMITER $$
CREATE OR REPLACE FUNCTION jumlahStok(idkode VARCHAR(10))
RETURNS INT
BEGIN
	DECLARE jumlah INT;
	SELECT stok INTO jumlah FROM tbproduk WHERE kode = idkode;
	RETURN jumlah;
END $$

SELECT jumlahStok('KPD02') AS 'Jumlah Stok Barang';




-- Query User Define Function (menampilkan total stok produk berdasarkan kategori) -- 
DELIMITER $$
CREATE OR REPLACE FUNCTION jumlahStokKategori(id CHAR(5))
RETURNS INT
BEGIN
	DECLARE jumlah INT;
	SELECT SUM(stok) INTO jumlah FROM tbproduk WHERE idkategori = id;
	RETURN jumlah;
END $$

SELECT jumlahStokKategori('K08') AS 'Jumlah Stok Barang - Kategori';





-- Query User Define Function (menampilkan jumlah barang berdasarkan kriteria tertentu) -- 
DELIMITER $$
CREATE OR REPLACE FUNCTION hargaBarang(harga_barang INT)
RETURNS INT

BEGIN 
	DECLARE jumlah INT;
	SELECT COUNT(harga) INTO jumlah FROM tbproduk WHERE harga < harga_barang;
	RETURN jumlah;
END $$

SELECT hargaBarang(500000) AS 'Jumlah data barang dengan harga < Rp. 500.000';











-- Tugas Praktikum 8 -- 

-- No. 1 Buat query procedure untuk menambah data member
DELIMITER $$
CREATE OR REPLACE PROCEDURE tambahMember(IN id VARCHAR(10),
IN nama VARCHAR(40), IN alamat VARCHAR(45), IN telepon VARCHAR(15))
BEGIN 
	INSERT INTO tbmember(idmember, namamember, alamat, telp) VALUES(id, nama, alamat, telepon);
END $$

CALL tambahMember('M06', 'Kinar Mizania', 'Banjarnegara', NULL);
CALL tambahMember('M07', 'Anjar Laksmana', NULL, NULL);
SELECT * FROM tbmember;



-- No. 2 Buat query procedure untuk mengubah data member
DELIMITER$$
CREATE OR REPLACE PROCEDURE ubahMember(IN id VARCHAR(10),
IN nama VARCHAR(40), IN alamat VARCHAR(45), IN telepon VARCHAR(15))
BEGIN 
	UPDATE tbmember SET namamember = nama,
	alamat = alamat, telp = telepon
	WHERE idmember = id;

END $$

CALL ubahMember('M06', 'Kinar Mizania', 'Purwokerto', '089161523163');
CALL ubahMember('M07', 'Anjar Laksmana', 'Surakarta', '085165354233');
SELECT * FROM tbmember;



-- No. 3 Buat query procedure untuk menghapus data member
DELIMITER$$
CREATE OR REPLACE PROCEDURE hapusMember(IN id VARCHAR(10))
BEGIN 
	DELETE FROM tbmember WHERE idmember = id;
END$$

CALL hapusMember('M06');
CALL hapusMember('M07');
SELECT * FROM tbmember;



-- No. 4 Buat query procedure untuk menghitungh jumlah member
DELIMITER$$
CREATE OR REPLACE PROCEDURE jumlahMember(OUT hasil INT)
BEGIN 
	SELECT COUNT(*) INTO hasil FROM tbmember;
END$$

CALL jumlahMember(@jumlah_member);
SELECT @jumlah_member AS 'Jumlah Member';
SELECT * FROM tbmember;





-- No. 5 Buat procedure data produk yang kurang dari 10
DELIMITER $$
CREATE OR REPLACE PROCEDURE jumlahProdukUnder10(IN stok_barang INT, OUT hasil INT)
BEGIN
    SELECT COUNT(*) INTO hasil FROM tbproduk WHERE stok < stok_barang;
END $$

CALL jumlahProdukUnder10(10, @jumlah);
SELECT @jumlah AS 'Jumlah Stok Barang < 10';
SELECT * FROM tbproduk;





-- No. 6 Buat query User Define Function (menampilkan total penjualah produk berdasarkan nomor nota)
DELIMITER $$
CREATE OR REPLACE FUNCTION totalPenjualan(nota_penjualan INT)
RETURNS INT
BEGIN 
	DECLARE jumlah INT;
	SELECT SUM(total) INTO jumlah FROM tbpenjualan WHERE nota = nota_penjualan;
	RETURN jumlah;
END $$

SELECT totalPenjualan(1102) AS 'Total Penjualan Barang';




-- No. 7 Buat query User Define Function (menampilkan jumlah produk dengan stok kurang dari 10)
DELIMITER $$
CREATE OR REPLACE FUNCTION jumlahProdukStok(stok_barang INT)
RETURNS INT
BEGIN 
	DECLARE jumlah INT;
	SELECT COUNT(*) INTO jumlah FROM tbproduk WHERE stok < stok_barang;
	RETURN jumlah;
END $$

SELECT jumlahProdukStok(10) AS 'Jumlah Stok Produk < 10';