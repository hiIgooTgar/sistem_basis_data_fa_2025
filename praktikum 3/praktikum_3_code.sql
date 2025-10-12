CREATE DATABASE 24sa11a159_ampu_mart
USE 24sa11a159_ampu_mart


CREATE TABLE tbkaryawan 
(
 idkaryawan VARCHAR(5) NOT NULL PRIMARY KEY,
 namakaryawan VARCHAR(50) NOT NULL,
 teleponkaryawan VARCHAR(15) NOT NULL,
 jabatan VARCHAR(20),
 sandi VARCHAR(20) NOT NULL
)


CREATE TABLE tbpelanggan 
(
 idpelanggan VARCHAR(10) NOT NULL PRIMARY KEY,
 namapelanggan VARCHAR(50) NOT NULL,
 alamatpelanggan VARCHAR(20) NOT NULL,
 teleponpelanggan VARCHAR(25) NOT NULL
)


CREATE TABLE tbpemasok 
(
 idpemasok VARCHAR(5) NOT NULL,
 namapemasok VARCHAR(50) NOT NULL,
 kontak VARCHAR(25),
 pic VARCHAR(35) NOT NULL,
 PRIMARY KEY (idpemasok)
)


CREATE TABLE tbkategori
(
 idkategori VARCHAR(3) NOT NULL PRIMARY KEY,
 namakategori VARCHAR(40) NOT NULL
)


CREATE TABLE tbproduk 
(
 idproduk VARCHAR(15) NOT NULL PRIMARY KEY,
 namaproduk VARCHAR(70) NOT NULL,
 idkategori VARCHAR(3) NOT NULL,
 stok INT,
 harga INT,
 FOREIGN KEY (idkategori) REFERENCES tbkategori (idkategori)
)


CREATE TABLE tbpenjualan 
(
 notajual VARCHAR(15) NOT NULL PRIMARY KEY,
 tgljual DATE NOT NULL, 
 idkaryawan VARCHAR(5) NOT NULL,
 idpelanggan VARCHAR(10) NOT NULL,
 totaljual INT,
 FOREIGN KEY (idkaryawan) REFERENCES tbkaryawan (idkaryawan),
 FOREIGN KEY (idpelanggan) REFERENCES tbpelanggan (idpelanggan)
)


CREATE TABLE tbdetailjual
(
 notajual VARCHAR(15),
 idproduk VARCHAR(15),
 jumlah SMALLINT,
 harga INT,
 subtotal INT,
 FOREIGN KEY (notajual) REFERENCES tbpenjualan(notajual),
 FOREIGN KEY (idproduk) REFERENCES tbproduk(idproduk)
)


CREATE TABLE tbpembelian 
(
 notabeli VARCHAR(15) NOT NULL PRIMARY KEY,
 tglbeli DATE NOT NULL,
 idkaryawan VARCHAR(5) NOT NULL,
 idpemasok VARCHAR(5) NOT NULL,
 totalbeli INT,
 FOREIGN KEY (idkaryawan) REFERENCES tbkaryawan(idkaryawan),
 FOREIGN KEY (idpemasok) REFERENCES tbpemasok(idpemasok)
)