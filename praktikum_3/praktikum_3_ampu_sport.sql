CREATE DATABASE 24sa11a159_ampu_sport;

USE 24sa11a159_ampu_sport

CREATE TABLE tbpengguna(
 id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(30) UNIQUE NOT NULL,
 sandi VARCHAR(20) NOT NULL,
 nama VARCHAR(40),
 jabatan ENUM('admin', 'kasir') NOT NULL
)

CREATE TABLE tbkategori ( 
 idkategori VARCHAR(6) PRIMARY KEY,
 nama_kategori VARCHAR(100) UNIQUE
)

CREATE TABLE tbmember (
 idmember VARCHAR(15) PRIMARY KEY,
 namamember VARCHAR(70) NOT NULL,
 alamat VARCHAR(65),
 telp VARCHAR(20)
)

CREATE TABLE tbpemasok (
 idpemasok VARCHAR(15) PRIMARY KEY,
 namapemasok VARCHAR(70) NOT NULL,
 kontak VARCHAR(60),
 alamat VARCHAR(65),
 email VARCHAR(70) NOT NULL,
 telp VARCHAR(20)
)

CREATE TABLE tbproduk (
 kode VARCHAR(15) NOT NULL PRIMARY KEY,
 nama VARCHAR(100) NOT NULL,
 idkategori VARCHAR(6) NOT NULL,
 harga INT DEFAULT 0,
 stok INT DEFAULT 0,
 FOREIGN KEY (idkategori) REFERENCES tbkategori(idkategori)
)

CREATE TABLE tbpenjualan (
 nota INT AUTO_INCREMENT PRIMARY KEY,
 tgltransaksi DATE,
 id INT,
 idmember VARCHAR(15),
 total INT,
 FOREIGN KEY (id) REFERENCES tbpengguna(id),
 FOREIGN KEY (idmember) REFERENCES tbmember(idmember)
)

CREATE TABLE tbdetailjual (
 nota INT NOT NULL,
 kode VARCHAR(15),
 jml INT,
 harga INT,
 subtotal INT,
 FOREIGN KEY (nota) REFERENCES tbpenjualan(nota),
 FOREIGN KEY (kode) REFERENCES tbproduk(kode)
)

CREATE TABLE tbpembelian (
 notabeli VARCHAR(50) PRIMARY KEY,
 tgl DATE,
 id INT,
 idpemasok VARCHAR(15),
 totalbeli INT,
 FOREIGN KEY (id) REFERENCES tbpengguna(id),
 FOREIGN KEY (idpemasok) REFERENCES tbpemasok(idpemasok)
)


CREATE TABLE tbdetailbeli (
 notabeli VARCHAR(50) NOT NULL,
 kode VARCHAR(15),
 jml INT,
 hargabeli INT,
 subtotal INT,
 FOREIGN KEY (notabeli) REFERENCES tbpembelian(notabeli),
 FOREIGN KEY (kode) REFERENCES tbproduk(kode)
)
