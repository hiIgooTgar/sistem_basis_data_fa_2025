/* Query cursor yang dapat menampung nama member domisili purwokerto */

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_alamatmemmber()
BEGIN 
 DECLARE name_member VARCHAR(64);
 DECLARE exit_loop BOOLEAN;
 DECLARE cursor1 CURSOR FOR
	SELECT namamember FROM tbmember WHERE alamat = "Purwokerto";
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;

 OPEN cursor1;
 
 ulang: LOOP	
  FETCH cursor1 INTO name_member;
	SELECT namamember AS 'Daftar member berdomisili Purwokerto' 
	FROM tbmember WHERE alamat = 'Purwokerto';
	
	IF exit_loop THEN 
		CLOSE cursor1;
		LEAVE ulang;
	END IF;
END LOOP ulang;
END $$

CALL cursor_alamatmemmber();






/*
Query cursor yang dapat menampung nama member dari tabel pelanggan
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_carimember(id VARCHAR(32))
BEGIN 
  DECLARE name_member VARCHAR(64);
  DECLARE cursor1 CURSOR FOR
	SELECT namamember FROM tbmember WHERE idmember = id;
  DECLARE EXIT HANDLER FOR 1329
  BEGIN 
	SELECT CONCAT('Data member ', id, ' tidak ditemukan!') AS message;
  END;
  
  OPEN cursor1;
  FETCH cursor1 INTO name_member;
	SELECT name_member;
  CLOSE cursor1;
END $$

CALL cursor_carimember('M02');
CALL cursor_carimember('M10');







/*
Query cursor yang dapat menampung jumlah member dikelompokkan berdasarkan alamat
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_membercount()
BEGIN
 DECLARE alamat_member VARCHAR(64);
 DECLARE count_member INT(10) UNSIGNED;
 DECLARE jumlah_member CURSOR FOR
	SELECT alamat, COUNT(*) FROM tbmember GROUP BY alamat;
 OPEN jumlah_member;
	FETCH jumlah_member INTO alamat_member, count_member;
	SELECT alamat, COUNT(*) AS 'Jumlah Member' FROM tbmember GROUP BY alamat;
 CLOSE jumlah_member;
END $$

CALL cursor_membercount();







/*
Query cursor yang dapat menampung daftar produk dengan harga > 400.000
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_hargaproduk()
BEGIN
 DECLARE nama_produk VARCHAR(64);
 DECLARE exit_loop BOOLEAN;
 DECLARE cursor1 CURSOR FOR
	SELECT nama FROM tbproduk WHERE harga > 400000;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
 DECLARE EXIT HANDLER FOR 1329
   BEGIN
     SELECT CONCAT('Data produk tidak ditemukan!') AS message;
   END;
 
 OPEN cursor1;
 lbl: LOOP
   FETCH cursor1 INTO nama_produk;
	SELECT nama AS 'Daftar produk dengan harga > 400000'
	FROM tbproduk WHERE harga > 400000;
	
	IF exit_loop THEN 
		CLOSE cursor1;
		LEAVE lbl;
	END IF;
 END LOOP lbl;
END $$

CALL cursor_hargaproduk();
SELECT * FROM tbproduk ORDER BY harga DESC;







/*
Jika daftar produk di tabel produk diurutkan secara menaik (ascending) berdasarkan
stok, perintah query cursor yang dapat menampilkan daftar 5 produk teratas yang ada
dalam daftar tersebut adalah sebagai berikut.
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_stokbarang()
BEGIN
 DECLARE nama_produk VARCHAR(64);
 DECLARE stok_produk INT;
 DECLARE exit_loop BOOLEAN;
 DECLARE cursor1 CURSOR FOR 
	SELECT nama, stok FROM tbproduk ORDER BY stok;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
 
 OPEN cursor1;
  lbl:LOOP
    FETCH cursor1 INTO nama_produk, stok_produk;
	SELECT nama, stok AS 'Daftar 5 produk dengan stok terendah' 
	FROM tbproduk ORDER BY stok LIMIT 5;
	IF exit_loop THEN
		CLOSE cursor1;
		LEAVE lbl;
	END IF;
  END LOOP lbl;
END $$

CALL cursor_stokbarang();