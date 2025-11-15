-- No 1
CREATE DATABASE responsi_igotegarprambudhy;
USE responsi_igotegarprambudhy;

-- No 2
CREATE TABLE tbanggota (
	idanggota VARCHAR(5) PRIMARY KEY,
	nama VARCHAR(70) NOT NULL,
	alamat VARCHAR(50)
)

CREATE TABLE tbpeminjaman (
	idpinjam VARCHAR(11) PRIMARY KEY,
	idanggota VARCHAR(5),
	judul VARCHAR(100) NOT NULL,
	tglpinjam DATE,
	tglkembali DATE,
	ket ENUM('dipinjam','kembali') DEFAULT 'dipinjam',
	FOREIGN KEY (idanggota) REFERENCES tbanggota(idanggota)
)

-- No 3
INSERT INTO tbanggota(idanggota, nama, alamat) VALUES
('A1', 'Igo Tegar Prambudhy', 'Purbalingga'),
('A2', 'Azzam Rabbani', 'Banyumas'),
('A3', 'Andhika Saputra', 'Pemalang');

INSERT INTO tbpeminjaman(idpinjam, idanggota, judul, tglpinjam, tglkembali, ket) VALUES
('1', 'A1', 'Pemrograman Berorientasi Objek', '2025-11-2', '2025-11-5', 'kembali'),
('2', 'A2', 'Pemrograman Bahasa Alami', '2025-11-3', NULL, 'dipinjam'),
('3', 'A3', 'Pemrograman Web', '2025-11-4', '2025-11-7', 'kembali');


-- No 4
INSERT INTO tbanggota(idanggota, nama, alamat) VALUES
('A4', 'Igo Tegar Prambudhy', 'Purbalingga')


-- No 5
INSERT INTO tbpeminjaman(idpinjam, idanggota, judul, tglpinjam, tglkembali, ket) VALUES
('7', 'A4', 'Basis Data', '2025-11-15', NULL, 'dipinjam')


-- No 6
UPDATE tbanggota SET alamat = "Cilacap" WHERE idanggota = "A3" 


-- No 7
SELECT * FROM tbpeminjaman WHERE ket = 'dipinjam'


-- No 8
SELECT tglpinjam AS tanggal_yang_dipinjam, COUNT(*) AS jumlah_dipinjam 
FROM tbpeminjaman GROUP BY tglpinjam


-- No 9
SELECT idanggota AS anggota_yang_meminjam_lebih_dari_1, COUNT(*) AS jumlah_dipinjam 
FROM tbpeminjaman GROUP BY anggota_yang_meminjam_lebih_dari_1 HAVING COUNT(*) > 1


-- No 10
SELECT tba.idanggota, tba.nama, tbp.idpinjam FROM tbanggota AS tba 
LEFT JOIN tbpeminjaman AS tbp ON tba.idanggota = tbp.idanggota


-- No. 11 
SELECT tbp.idpinjam, tba.idanggota, tba.nama, tbp.judul, tbp.ket FROM tbpeminjaman AS tbp
INNER JOIN tbanggota AS tba ON tbp.idanggota = tba.idanggota WHERE tbp.ket = 'dipinjam'


-- No 12
DROP DATABASE responsi_igotegarprambudhy
