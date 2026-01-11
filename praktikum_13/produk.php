<?php
require_once 'connect.php';
require_once 'header.php';

echo "<div class='container'>";

// Proses penghapusan
if (isset($_POST['delete'])) {
    $id = $_POST['kode'];
    $sql = "DELETE FROM tbproduk WHERE kode = '$id'";
    if ($con->query($sql) === TRUE) {
        header("Location: produk.php");
        exit();
    } else {
        echo "<div class='alert alert-danger'>Gagal menghapus data</div>";
    }
}

// Ambil data produk
$sql = "SELECT 
    p.kode, 
    p.nama, 
    k.nama_kategori, 
    p.harga, 
    p.stok 
FROM tbproduk AS p
LEFT JOIN tbkategori AS k ON p.idkategori = k.idkategori 
ORDER BY p.kode ASC;";
$result = $con->query($sql);

if ($result->num_rows > 0) {
?><div class="container py-5" style="margin-top: 3rem;">
    <h2>Data Produk</h2>
    <p>Aplikasi Ampu Sport - Peralatan Olahraga</p>
    <br>
    <a href="insertproduk.php" class="btn btn-primary">Tambah Data</a>
    <br><br>

    <table class="table table-bordered table-striped">
        <tr>
            <th>Kode Produk</th>
            <th>Nama Produk</th>
            <th>Nama Kategori</th>
            <th>Harga</th>
            <th>Stok</th>
            <th colspan="2">Aksi</th>
        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $row['kode']; ?></td>
            <td><?php echo $row['nama']; ?></td>
            <td><?php echo $row['nama_kategori']; ?></td>
            <td><?php echo $row['harga']; ?></td>
            <td><?php echo $row['stok']; ?></td>
            <td>
                <a href="editkategori.php?id=<?php echo $row['kode']; ?>" class="btn btn-warning btn-sm">Ubah</a>
                <form method="post" action="" style="display:inline;"
                    onsubmit="return confirm('Yakin ingin menghapus data ini?');">
                    <input type="hidden" name="id" value="<?php echo $row['kode']; ?>">
                    <input type="submit" name="delete" value="Hapus" class="btn btn-danger btn-sm">
                </form>
            </td>
        </tr>
        <?php } ?>
    </table>
    <?php
} else {
    echo "<br><br><div class='alert alert-warning'>Tidak ada data Kategori.</div>";
}
    ?>
</div>