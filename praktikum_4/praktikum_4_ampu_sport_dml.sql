-- Data Manipulation Language (INSERT) --

/* Insert Tabel Pengguna */
INSERT INTO tbpengguna(id, username, sandi, jabatan, nama) VALUES
(1, 'admin1', 'admin123', 'admin', 'Aisha Putri'),
(2, 'kasir1', 'kasir123', 'kasir', 'Kamila Ayu Ningsih');

INSERT INTO tbpengguna VALUES
(3, 'admin2', 'admin321', 'admin', 'Indah Mekar'),
(4, 'kasir2', 'kasir321', 'kasir', 'Kusuma Pamungkas');


/* Insert Tabel Member */
INSERT INTO tbmember(idmember, namamember, alamat, telp) VALUES
('M01', 'Andi Saputra', 'Banyumas', '089511021281'),
('M02', 'Budi Santoso', 'Purwokerto', '0859210193837'),
('M03', 'Citra Lestari', 'Sokaraja', '089232982132'),
('M04', 'Dewi Anggraini', 'Banjarnegara', '0859210193837'),
('M05', 'Eko Prasetyo', 'Purbalingga', '089232982132');

INSERT INTO tbmember VALUES
('M01', 'Andi Saputra', 'Banyumas', '089511021281'),
('M02', 'Budi Santoso', 'Purwokerto', '0859210193837'),
('M03', 'Citra Lestari', 'Sokaraja', '089232982132'),
('M04', 'Dewi Anggraini', 'Banjarnegara', '0859210193837'),
('M05', 'Eko Prasetyo', 'Purbalingga', '089232982132');

/* Insert Tabel Kategori */
INSERT INTO tbkategori(idkategori, nama_kategori) VALUES
('K01', 'Alat Fitnes'),
('K02', 'Peralatan Sepak Bola'),
('K03', 'Peralatan Bulu Tangkis'),
('K04', 'Peralatan Basket'),
('K05', 'Peralatan Renang'),
('K06', 'Peralatan Tenis'),
('K07', 'Peralatan Voli'),
('K08', 'Peralatan Outdoor'),
('K09', 'Pakaian Olahraga'),
('K10', 'Aksesori Olahraga');

INSERT INTO tbkategori VALUES
('K01', 'Alat Fitnes'),
('K02', 'Peralatan Sepak Bola'),
('K03', 'Peralatan Bulu Tangkis'),
('K04', 'Peralatan Basket'),
('K05', 'Peralatan Renang'),
('K06', 'Peralatan Tenis'),
('K07', 'Peralatan Voli'),
('K08', 'Peralatan Outdoor'),
('K09', 'Pakaian Olahraga'),
('K10', 'Aksesori Olahraga');


/* Insert Tabel Pemasok */
INSERT INTO tbpemasok(idpemasok, namapemasok, kontak, alamat, email, telp) VALUES
('ISP01', 'PT Atletik Jaya Perkasa', 'Kevin Sanjaya', 'Jl. Arena No. 5, Jakarta Pusat', 'athletic.jaya@sports.com', '(021)9001122'),
('ISP02', 'PT Futsalindo Sukses', 'Yoga Pratama', 'Jl. Pelangi No. 12, Bekasi', 'futsalindo@sports.com', '081234567890'),
('ISP03', 'PT Sepatu Lari Ultra', 'Rina Marlina', 'Jl. Merdeka Raya No. 101, Bandung', 'sepatu.lari@sports.com', '(022)7654321'),
('ISP04', 'PT Jete Perlengkapan Gym', 'Arya Seloka', 'Jl. Pantura Blok C, Bogor', 'jete.gym@sports.com', '087437434029'),
('ISP05', 'PT Bola Dunia Sarana Prima', 'Wiryaman', 'Jl. Merder No. 88, Surabaya', 'bola.dunia@sports.com', '(031)85874123'),
('ISP06', 'PT Raket Utama Indo', 'Wijaya Kusuma', 'Jl. Mekar No. 3, Yogyakarta', 'raket.utama@sports.com', '083434879181');

INSERT INTO tbpemasok VALUES
('ISP01', 'PT Atletik Jaya Perkasa', 'Kevin Sanjaya', 'Jl. Arena No. 5, Jakarta Pusat', 'athletic.jaya@sports.com', '(021)9001122'),
('ISP02', 'PT Futsalindo Sukses', 'Yoga Pratama', 'Jl. Pelangi No. 12, Bekasi', 'futsalindo@sports.com', '081234567890'),
('ISP03', 'PT Sepatu Lari Ultra', 'Rina Marlina', 'Jl. Merdeka Raya No. 101, Bandung', 'sepatu.lari@sports.com', '(022)7654321'),
('ISP04', 'PT Jete Perlengkapan Gym', 'Arya Seloka', 'Jl. Pantura Blok C, Bogor', 'jete.gym@sports.com', '087437434029'),
('ISP05', 'PT Bola Dunia Sarana Prima', 'Wiryaman', 'Jl. Merder No. 88, Surabaya', 'bola.dunia@sports.com', '(031)85874123'),
('ISP06', 'PT Raket Utama Indo', 'Wijaya Kusuma', 'Jl. Mekar No. 3, Yogyakarta', 'raket.utama@sports.com', '083434879181');
 

/* Insert Tabel Produk */
INSERT INTO tbproduk(kode, nama, idkategori, harga, stok) VALUES
("KPD01", "Mistar Lompat Tinggi", "K08", 200000, 100),
("KPD02", "Sepatu Futsal - Lightning Striker", "K02", 800000, 80),
("KPD03", "Sepatu Marathon - Red Mils", "K08", 1500000, 80),
("KPD04", "Barbel Hexagonal", "K01", 300000, 120),
("KPD05", "Bola (Piala Series)", "K02", 500000, 300),
("KPD06", "Raket Carbon Pro", "K03", 1200000, 50);

INSERT INTO tbproduk VALUES
("KPD01", "Mistar Lompat Tinggi", "K08", 200000, 100),
("KPD02", "Sepatu Futsal - Lightning Striker", "K02", 800000, 80),
("KPD03", "Sepatu Marathon - Red Mils", "K08", 1500000, 80),
("KPD04", "Barbel Hexagonal", "K01", 300000, 120),
("KPD05", "Bola (Piala Series)", "K02", 500000, 300),
("KPD06", "Raket Carbon Pro", "K03", 1200000, 50);


/* Insert Tabel Penjualan */
INSERT INTO tbpenjualan(nota, tgltransaksi, id, idmember, total) VALUES
(1101, '2025-10-1', 1, 'M01', 1600000),
(1102, '2025-10-4', 2, 'M02', 300000),
(1103, '2025-10-8', 2, 'M03', 3000000),
(1104, '2025-10-10', 2, 'M04', 400000),
(1105, '2025-10-15', 1, 'M05', 1200000);

INSERT INTO tbpenjualan VALUES
(1101, '2025-10-1', 1, 'M01', 1600000),
(1102, '2025-10-4', 2, 'M02', 300000),
(1103, '2025-10-8', 2, 'M03', 3000000),
(1104, '2025-10-10', 2, 'M04', 400000),
(1105, '2025-10-15', 1, 'M05', 1200000);


/* Insert Tabel Detail Penjualan */
INSERT INTO tbdetailjual(nota, kode, jml, harga, subtotal) VALUES
(1101, 'KPD02', 2, 800000, 1600000), 
(1102, 'KPD04', 1, 300000, 300000),  
(1103, 'KPD05', 6, 500000, 3000000), 
(1104, 'KPD01', 2, 200000, 400000),
(1105, 'KPD06', 1, 1200000, 1200000);

INSERT INTO tbdetailjual VALUES
(1101, 'KPD02', 2, 800000, 1600000), 
(1102, 'KPD04', 1, 300000, 300000),  
(1103, 'KPD05', 3, 500000, 1500000), 
(1104, 'KPD01', 2, 200000, 400000),
(1105, 'KPD06', 1, 1200000, 1200000);


/* Insert Tabel Pembelian */
INSERT INTO tbpembelian(notabeli, tgl, id, idpemasok, totalbeli) VALUES
('NBP01', '2025-9-1', 1, 'ISP02', 1600000),
('NBP02', '2025-9-5', 2, 'ISP04', 300000),
('NBP03', '2025-9-10', 2, 'ISP05', 1500000),
('NBP04', '2025-9-12', 2, 'ISP01', 400000),
('NBP05', '2025-9-19', 1, 'ISP06', 1200000);

INSERT INTO tbpembelian VALUES
('NBP01', '2025-9-1', 1, 'ISP02', 1600000),
('NBP02', '2025-9-5', 2, 'ISP04', 300000),
('NBP03', '2025-9-10', 2, 'ISP05', 1500000),
('NBP04', '2025-9-12', 2, 'ISP01', 400000),
('NBP05', '2025-9-19', 1, 'ISP06', 1200000);


/* Insert Tabel Detail Pembelian */
INSERT INTO tbdetailbeli(notabeli, kode, jml, hargabeli, subtotal) VALUES
('NBP01', 'KPD02', 2, 800000, 1600000), 
('NBP02', 'KPD04', 1, 300000, 300000),  
('NBP03', 'KPD05', 3, 500000, 1500000), 
('NBP04', 'KPD01', 2, 200000, 400000),
('NBP05', 'KPD06', 1, 1200000, 1200000);

INSERT INTO tbdetailbeli VALUES
('NBP01', 'KPD02', 2, 800000, 1600000), 
('NBP02', 'KPD04', 1, 300000, 300000),  
('NBP03', 'KPD05', 3, 500000, 1500000), 
('NBP04', 'KPD01', 2, 200000, 400000),
('NBP05', 'KPD06', 1, 1200000, 1200000);




-- Data Manipulation Language (UPDATE) --
UPDATE tbmember SET alamat = "Purwokerto" WHERE idmember = "M03";

UPDATE tbkategori SET nama_kategori = "Peralatan Sepak Bola dan Futsal" WHERE idkategori = "K02";
UPDATE tbpengguna SET nama = "Lukman Adi" WHERE id = 3;
UPDATE tbmember SET telp = "08158237812" WHERE idmember = "M01";


-- Data Manipulation Language (DELETE) --
DELETE FROM tbkategori WHERE idkategori = 'K11';

DELETE FROM tbmember WHERE idmember = 'M05';
DELETE FROM tbpengguna WHERE id = 3;
DELETE FROM tbproduk WHERE kode = "KPD01";

/* Perintah DML - SELECT */
SELECT * FROM tbpengguna;
SELECT * FROM tbkategori;
SELECT * FROM tbmember;

SELECT * FROM tbpemasok;
SELECT * FROM tbproduk;
SELECT * FROM tbpenjualan;
SELECT * FROM tbdetailjual;
SELECT * FROM tbpembelian;
SELECT * FROM tbdetailbeli;





-- Tugas Praktikum 4 - DML --

-- 1. Operator
SELECT namamember, alamat FROM tbmember WHERE alamat = 'Purwokerto'
SELECT kode, nama, stok FROM tbproduk WHERE stok <= 120

-- 2. Between/Not Between
SELECT idmember, namamember FROM tbmember WHERE idmember BETWEEN 'M02' AND 'M04';
SELECT idkategori, nama_kategori FROM tbkategori WHERE idkategori NOT BETWEEN 'K01' AND 'K08';

-- 3. Like/Not Like
SELECT kode, nama, harga FROM tbproduk WHERE nama LIKE '%Sepatu%';
SELECT * FROM tbkategori WHERE nama_kategori NOT LIKE '%Peralatan%';

-- 4. In/Not In
SELECT nota, tgltransaksi, idmember, total FROM tbpenjualan WHERE idmember IN ('M01', 'M03');
SELECT kode, nama, harga FROM tbproduk WHERE kode NOT IN (SELECT kode FROM tbdetailjual WHERE nota = 1101);

-- 5. Order by Descending 
SELECT * FROM tbproduk ORDER BY kode DESC
SELECT * FROM tbmember WHERE idmember LIKE "%M%" ORDER BY idmember DESC