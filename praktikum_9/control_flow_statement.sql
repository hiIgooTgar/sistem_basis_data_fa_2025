-- Query percabangan untuk menampilkan keterangan stok produk
SELECT kode, stok,
	IF(stok <= 40, 'Stok Terbatas',
	IF(stok <= 80, 'Stok Cukup', 'Stok Berlebih'))
	AS 'Keterangan'
FROM tbproduk ORDER BY stok;

SELECT * FROM tbproduk;


-- Query untuk menampilkan keterangan alamat pelanggan yg di luar purwokerto
SELECT idmember, alamat,
	IF(alamat = 'Purwokerto' OR alamat = 'PWT', 'Di Kota Purwokerto', 'Luar Purwokerto')
	AS 'Keterangan Alamat'
FROM tbmember;


SELECT * FROM tbmember;


-- Query untuk menampilkan keterangan harga produk
SELECT kode, nama, harga,
  CASE 
    WHEN harga < 300000 THEN 'Murah'
    WHEN harga BETWEEN 300000 AND 800000 THEN 'Sedang'
    ELSE 'Mahal'
  END AS 'Kategori Harga'
FROM tbproduk;


SELECT * FROM tbproduk;  
  
  -- Query mengecek jumlah transaksi member
DELIMITER $$  
CREATE OR REPLACE FUNCTION cekTransaksi(id VARCHAR(50))
RETURNS VARCHAR(100)
  
  BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(nota) INTO jumlah FROM tbpenjualan WHERE idmember = id;
	IF jumlah > 0 THEN
		RETURN CONCAT('Member ini sudah bertransaksi sebanyak ', jumlah, ' kali');
	ELSE
		RETURN 'Member ini belum pernah bertransaksi';
	END IF;
END $$

SELECT cekTransaksi('M01');
SELECT cekTransaksi('M02');
SELECT cekTransaksi('M06');
SELECT cekTransaksi('M07');

SELECT * FROM tbpenjualan;


-- Query untuk menampilkan bilangan ganjil
DELIMITER $$
CREATE OR REPLACE PROCEDURE bilanganGanjil(IN batas INT)
BEGIN 
	DECLARE i INT;
	DECLARE hasil VARCHAR(100) DEFAULT '';
	SET i = 1;
	WHILE i < batas DO
		IF MOD(i, 2) != 0 THEN 
		SET hasil = CONCAT(hasil, i, ' ');
		END IF;
		SET i = i + 1;
	END WHILE;
	SELECT hasil;
END $$

CALL bilanganGanjil(20);




-- Soal Praktikum
-- 1. Buat query yang menampilkan diskon 10% jika kategori = K09 (Pakaian Olahraga), selain itu tidak dapat diskon.

SELECT kode, nama, idkategori, harga,
	IF(idkategori = 'K09', harga - (harga * 0.10), 0)
	AS Diskon
FROM tbproduk;


-- 2
SELECT kode, jml AS 'sum(jml)',
	IF(jml BETWEEN 1 AND 5, 'Rendah',
	IF(jml BETWEEN 6 AND 20, 'Sedang', 'Tinggi'))
	AS level_penjualan
FROM tbdetailjual


-- 3
DELIMITER $$  
CREATE OR REPLACE FUNCTION cekTransaksiPemasok(id VARCHAR(50))
RETURNS VARCHAR(100)
  
  BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(notabeli) INTO jumlah FROM tbpembelian WHERE idpemasok = id;
	IF jumlah > 0 THEN
		RETURN CONCAT('Pemasok ini sudah bertransaksi sebanyak ', jumlah, ' kali');
	ELSE
		RETURN 'Pemasok ini belum pernah bertransaksi';
	END IF;
END $$

SELECT cekTransaksiPemasok('ISP02');
SELECT cekTransaksiPemasok('ISP06');

SELECT * FROM tbpembelian;


-- 4 bilangan genap 1-25 menggunakan looping
DELIMITER $$
CREATE OR REPLACE PROCEDURE bilanganGenap(IN batas INT)
BEGIN 
	DECLARE i INT;
	DECLARE hasil VARCHAR(100) DEFAULT '';
	SET i = 1;
	WHILE i < batas DO
		IF MOD(i, 2) = 0 THEN 
		SET hasil = CONCAT(hasil, i, ' ');
		END IF;
		SET i = i + 1;
	END WHILE;
	SELECT hasil;
END $$

CALL bilanganGenap(25);
