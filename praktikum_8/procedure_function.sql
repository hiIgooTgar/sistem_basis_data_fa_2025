DELIMITER $$
CREATE OR REPLACE PROCEDURE tambahMember(IN id VARCHAR(10),
IN nama VARCHAR(40), IN alamat VARCHAR(45), IN telepon VARCHAR(15))

BEGIN 
	INSERT INTO tbmember(idmember, namamember, alamat, telp) VALUES(id, nama, alamat, telepon);

END $$

CALL tambahMember('M06', 'Kinar Mizania', 'Banjarnegara', 'NULL');



DELIMITER$$
CREATE OR REPLACE PROCEDURE ubahMember(IN id VARCHAR(10),
IN nama VARCHAR(40), IN alamat VARCHAR(45), IN telepon VARCHAR(15))
BEGIN 
	UPDATE tbmember SET namamember = nama,
	alamat = alamat, telp = telepon
	WHERE idmember = id;

END $$

CALL ubahMember('M06', 'Kinar Mizania', 'Purwokerto', '089161523163');



DELIMITER$$
CREATE OR REPLACE PROCEDURE hapusMember(IN id VARCHAR(10))

BEGIN 
	DELETE FROM tbmember WHERE idmember = id;
END$$

CALL hapusMember('M06');


DROP PROCEDURE tambahMember;
DROP PROCEDURE ubahMember;
DROP PROCEDURE hapusMember;


DELIMITER$$
CREATE OR REPLACE PROCEDURE jumlahMember(OUT hasil INT)
BEGIN 
	SELECT COUNT(*) INTO hasil FROM tbmember;
END$$

CALL jumlahMember(@jumlah_member);
SELECT @jumlah_member AS 'Jumlah Member';




DELIMITER$$
CREATE OR REPLACE PROCEDURE jumlahMemberAlamat(IN alamat VARCHAR(45), OUT hasil INT)
BEGIN 
	SELECT COUNT(*) INTO hasil FROM tbmember
	WHERE alamat = alamat;
END$$

CALL jumlahMemberAlamat('Purbalingga', @jumlah);
SELECT @jumlah AS 'Jumlah Member';





SELECT namamember, LEFT(namamember, 5), RIGHT(namamember, 5) FROM tbmember;

SELECT tgltransaksi, DATEDIFF(NOW(), tgltransaksi) FROM tbpenjualan WHERE nota = 1102;

SELECT tgltransaksi, MONTHNAME(tgltransaksi) FROM tbpenjualan;





DELIMITER$$
CREATE OR REPLACE FUNCTION jumlahStok(idkode VARCHAR(10))
RETURNS INT

BEGIN
	DECLARE jumlah INT;
	SELECT stok INTO jumlah FROM tbproduk WHERE kode = idkode;
	RETURN jumlah;
END$$

SELECT jumlahStok('KPD01') AS 'Jumlah Stok Barang';




DELIMITER$$
CREATE OR REPLACE FUNCTION jumlahStokKategori(id VARCHAR(10))
RETURNS INT

BEGIN
	DECLARE jumlah INT;
	SELECT SUM(stok) INTO jumlah FROM tbproduk WHERE idkategori = id;
	RETURN jumlah;
END$$

SELECT jumlahStokKategori('K08') AS 'Jumlah Stok Barang - Kategori';




DELIMITER$$
CREATE OR REPLACE FUNCTION hargaBarang(harga_barang INT)
RETURNS INT

BEGIN 
	DECLARE jumlah INT;
	SELECT COUNT(harga) INTO jumlah FROM tbproduk WHERE harga <= harga_barang;
	RETURN jumlah;
END$$

SELECT hargaBarang(500000) AS 'Jumlah data barang dengan harga <= Rp. 500.000';



DROP FUNCTION jumlahStok;
DROP FUNCTION jumlahStokKategori;
DROP FUNCTION hargaBarang;