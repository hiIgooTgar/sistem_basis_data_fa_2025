/*
Query cursor yang dapat menampung nama member dari tabel member
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE c_carimember(id VARCHAR(16))
BEGIN 
  DECLARE nama VARCHAR(64);
  DECLARE cur1 CURSOR FOR
	SELECT namamember FROM tbmember WHERE idmember = id;
  DECLARE EXIT HANDLER FOR NOT FOUND
  BEGIN 
	SELECT CONCAT('Data member ', id, ' tidak ditemukan!') AS message;
  END;
  
  OPEN cur1;
  FETCH cur1 INTO nama;
	SELECT nama;
  CLOSE cur1;
END $$

CALL c_carimember('M02');
CALL c_carimember('M10');





/*
Query cursor yang dapat menampung data member dikelompokkan berdasarkan alamat
*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE c_alamatcount()
BEGIN
 DECLARE p_alamat VARCHAR(64);
 DECLARE p_count INT;
 DECLARE selesai INT DEFAULT 0;
 
 DECLARE cur1 CURSOR FOR
	SELECT alamat, COUNT(*) FROM tbmember GROUP BY alamat;
	
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;
 
 CREATE TEMPORARY TABLE IF NOT EXISTS tmp_alamat (
	alamat VARCHAR(64),
	jml_member INT
 );
 
 TRUNCATE tmp_alamat;
 
 OPEN cur1;
 ulang: LOOP
	FETCH cur1 INTO p_alamat, p_count;
	IF selesai = 1 THEN 
		LEAVE ulang;
	END IF;
	INSERT INTO tmp_alamat VALUES (p_alamat, p_count);
 END LOOP;
 CLOSE cur1;
 SELECT * FROM tmp_alamat;
END $$

CALL c_alamatcount();



/* Query cursor yang dapat menampung data stok produk */

DELIMITER $$
CREATE OR REPLACE PROCEDURE cur_cekstok()
BEGIN
 DECLARE vnama VARCHAR(128);
 DECLARE vstok INT;
 DECLARE vket VARCHAR(64);
 DECLARE selesai INT DEFAULT 0;
 
 DECLARE c_stok CURSOR FOR 
	SELECT nama, stok FROM tbproduk ORDER BY stok DESC;
	
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;
 
 CREATE TEMPORARY TABLE IF NOT EXISTS tmp_stok (
	nama_produk VARCHAR(128),
	stok INT,
	keterangan VARCHAR(64)
 );
 
 TRUNCATE tmp_stok;
 
 OPEN c_stok;
  ulang:LOOP
    FETCH c_stok INTO vnama, vstok;
    
	IF selesai = 1 THEN
		LEAVE ulang;
	END IF;
	
	IF vstok = 0 THEN
		SET vket = 'Habis';
	ELSEIF vstok < 60 THEN 
		SET vket = 'Menipis';
	ELSE 
		SET vket = 'Tersedia';
	END IF;
	
	INSERT INTO tmp_stok VALUES (vnama, vstok, vket);
  END LOOP;
  CLOSE c_stok;
  SELECT * FROM tmp_stok;
END $$

CALL cur_cekstok();







/* Query cursor yang dapat menampung daftar produk dengan harga tertentu */

DELIMITER $$
CREATE OR REPLACE PROCEDURE cur_hargaproduk(IN p_harga INT)
BEGIN
 DECLARE vnama VARCHAR(128);
 DECLARE vharga INT;
 DECLARE selesai INT DEFAULT 0;
 
 DECLARE c_produk CURSOR FOR
	SELECT nama, harga FROM tbproduk WHERE harga >= p_harga;
	
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;
 
 CREATE TEMPORARY TABLE IF NOT EXISTS tmp_produk (
	nama_produk VARCHAR(128),
	harga INT
 );
 
 TRUNCATE tmp_produk;

 OPEN c_produk;
 ulang: LOOP
   FETCH c_produk INTO vnama, vharga;
	
	IF selesai = 1 THEN
		LEAVE ulang;
	END IF;
   
	INSERT INTO tmp_produk VALUES (vnama, vharga);
 END LOOP;
 CLOSE c_produk;
 
 IF (SELECT COUNT(*) FROM tmp_produk) > 0 THEN
	SELECT * FROM tmp_produk;
 ELSE 
	SELECT 'Data tidak ditemukan' AS message;
 END IF;
END $$


CALL cursor_hargaproduk(200000);
CALL cursor_hargaproduk(2000000);






















-- Soal Praktikum
/* No. 1 Buat procedure menggunakan query cursor yang dapat menampung nama member
yang beralamat Purwokerto. */

DELIMITER $$
CREATE OR REPLACE PROCEDURE cursor_alamatmember()
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

CALL cursor_alamatmember();




/* No. 2 Buatlah procedure menggunakan cursor untuk menghitung jumlah produk
berdasarkan kategori [data menampilkan: idkategori, namakategori dan jumlah
produk]. */ 

DELIMITER $$

CREATE PROCEDURE OR REPLACE cur_jmlperkategori()
BEGIN
    DECLARE v_idkategori VARCHAR(16);
    DECLARE v_namakategori VARCHAR(128);
    DECLARE v_jumlah INT;
    DECLARE selesai INT DEFAULT 0;

    DECLARE cur_kategori CURSOR FOR 
        SELECT idkategori, nama_kategori FROM tbkategori;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_kategori (
        idkategori VARCHAR(16),
        nama_kategori VARCHAR(128),
        jumlah INT
    );
    
    TRUNCATE TABLE tmp_kategori;

    OPEN cur_kategori;

    ulang: LOOP
        FETCH cur_kategori INTO v_idkategori, v_namakategori;
        
        IF selesai = 1 THEN 
            LEAVE ulang;
        END IF;
        
        SELECT COUNT(*) INTO v_jumlah FROM tbproduk WHERE idkategori = v_idkategori;
        INSERT INTO tmp_kategori VALUES (v_idkategori, v_namakategori, v_jumlah);
    END LOOP ulang;

    CLOSE cur_kategori;

    SELECT * FROM tmp_kategori;
END $$

CALL cur_jmlperkategori();




/* Mo.3 Buatlah procedure cursor yang dapat menerima input kode produk dan menampilkan
jumlah yang terjual. Jika kode produk tidak ada di tabel detail jual, tampilkan pesan
“produk belum pernah terjual” */

DELIMITER $$
CREATE OR REPLACE PROCEDURE cur_jumlahterjual(IN p_kode VARCHAR(15))
BEGIN
    DECLARE v_jml INT;
    DECLARE v_total_terjual INT DEFAULT 0;
    DECLARE selesai INT DEFAULT 0;
    DECLARE cek_data INT DEFAULT 0;

    DECLARE cursor_jumlahjual CURSOR FOR 
        SELECT jml FROM tbdetailjual WHERE kode = p_kode;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;

    OPEN cursor_jumlahjual;

    ulang: LOOP
        FETCH cursor_jumlahjual INTO v_jml;
        
        IF selesai = 1 THEN 
            LEAVE ulang;
        END IF;

        SET cek_data = 1;
        
        SET v_total_terjual = v_total_terjual + v_jml;
    END LOOP ulang;

    CLOSE cursor_jumlahjual;

    IF cek_data = 1 THEN
        SELECT p_kode AS kode, v_total_terjual AS jumlah_terjual;
    ELSE
        SELECT 'Produk belum pernah terjual' AS message;
    END IF;

END $$


SELECT * FROM tbdetailjual;
CALL cur_jumlahterjual('KPD02');
CALL cur_jumlahterjual('KPD1-0');













/*
Query cursor yang dapat menampung nama member dari tabel member
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



DROP PROCEDURE c_carimember;
DROP PROCEDURE c_alamatcount;
DROP PROCEDURE cur_cekstok;
DROP PROCEDURE cur_hargaproduk;

DROP PROCEDURE cursor_alamatmember;
DROP PROCEDURE cur_jmlperkategori;
DROP PROCEDURE cur_jumlahterjual;
 
DROP PROCEDURE cursor_carimember;
DROP PROCEDURE cursor_hargaproduk;
DROP PROCEDURE cursor_membercount;
DROP PROCEDURE cursor_stokbarang;
