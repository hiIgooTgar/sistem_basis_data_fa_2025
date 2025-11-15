/* Join tabel produk dengan tabel kategori  */
SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk p
CROSS JOIN tbkategori k

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk p
INNER JOIN tbkategori k ON p.idkategori = k.idkategori

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk p
LEFT JOIN tbkategori k ON p.idkategori = k.idkategori 

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk p
RIGHT JOIN tbkategori k ON p.idkategori = k.idkategori 

/* Inner join tabel detailpenjualan dengan tabel produk */
SELECT dj.kode, p.nama, dj.jml, dj.harga, dj.subtotal FROM tbdetailjual dj
INNER JOIN tbproduk p ON dj.kode = p.kode 
ORDER BY kode







/* Join tabel produk dengan tabel kategori - use AS  */
SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk AS p
CROSS JOIN tbkategori AS k

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk AS p
INNER JOIN tbkategori AS k ON p.idkategori = k.idkategori

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk AS p
LEFT JOIN tbkategori AS k ON p.idkategori = k.idkategori 

SELECT p.kode, p.nama, k.nama_kategori FROM tbproduk AS p
RIGHT JOIN tbkategori AS k ON p.idkategori = k.idkategori 

/* Inner join tabel detailpenjualan dengan tabel produk - use AS */
SELECT dj.kode, p.nama, dj.jml, dj.harga, dj.subtotal FROM tbdetailjual AS dj
INNER JOIN tbproduk AS p ON dj.kode = p.kode 
ORDER BY kode









/* Tugas Praktikum 6 */
-- No. 1
-- tabel member dengan tabel penjualan
SELECT p.nota, p.tgltransaksi, m.idmember, m.namamember FROM tbmember AS m
LEFT JOIN tbpenjualan AS p ON m.idmember = p.idmember

-- tabel penjualan dengan tabel member
SELECT p.nota, p.tgltransaksi, m.idmember, m.namamember FROM tbpenjualan AS p
LEFT JOIN tbmember AS m ON p.idmember = m.idmember



-- No. 2 
-- tabel produk dengan tabel detailjual
SELECT dj.nota, dj.kode, p.nama FROM tbproduk AS p
RIGHT JOIN tbdetailjual AS dj ON p.kode = dj.kode

-- tabel detailjual dengan tabel produk
SELECT dj.nota, dj.kode, p.nama FROM tbdetailjual AS dj
RIGHT JOIN tbproduk AS p ON dj.kode = p.kode


-- No. 3
SELECT pj.nota, pj.tgltransaksi, m.namamember, pg.nama AS nama_pengguna, pj.total AS total_penjualan 
FROM tbpenjualan AS pj
INNER JOIN tbmember AS m ON pj.idmember = m.idmember
INNER JOIN tbpengguna AS pg ON pj.id = pg.id

-- No. 4
SELECT pb.notabeli, pm.namapemasok, pd.nama AS nama_produk_yang_dibeli, db.jml AS jumlah, db.subtotal 
FROM tbpembelian AS pb
INNER JOIN tbdetailbeli AS db ON pb.notabeli = db.notabeli
INNER JOIN tbproduk AS pd ON db.kode = pd.kode
INNER JOIN tbpemasok AS pm ON pb.idpemasok = pm.idpemasok