<?php
require_once 'connect.php';
require_once 'header.php';

echo "<div class='container'>";

// Proses penghapusan
if (isset($_POST['delete'])) {
    $notabeli = $_POST['notabeli'];
    $sql = "DELETE FROM tbpembelian WHERE notabeli = '$notabeli'";
    if ($con->query($sql) === TRUE) {
        header("Location: pembelian.php");
        exit();
    } else {
        echo "<div class='alert alert-danger'>Gagal menghapus data</div>";
    }
}

// Ambil data pembelian
$sql = "SELECT p.notabeli, p.tgl, g.nama, m.namapemasok, p.totalbeli FROM tbpembelian AS p
LEFT JOIN tbpengguna AS g ON p.id = g.id
LEFT JOIN tbpemasok AS m ON p.idpemasok = m.idpemasok
 order by notabeli";
$result = $con->query($sql);

if ($result->num_rows > 0) {
?>
<div class="container py-5" style="margin-top: 3rem;">
    <h2>Data Penjualan</h2>
    <p>Aplikasi Ampu Sport - Peralatan Olahraga</p>
    <br>
    <a href="insertpengguna.php" class="btn btn-primary">Tambah Data</a>
    <br><br>

    <table class="table table-bordered table-striped">
        <tr>
            <th>Nota Pembelian</th>
            <th>Tanggal</th>
            <th>Nama Pengguna</th>
            <th>Nama Pemasok</th>
            <th>Total Pembelian</th>
            <th colspan=" 2">Aksi</th>
        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $row['notabeli']; ?></td>
            <td><?php echo $row['tgl']; ?></td>
            <td><?php echo $row['nama']; ?></td>
            <td><?php echo $row['namapemasok']; ?></td>
            <td><?php echo $row['totalbeli']; ?></td>
            <td>
                <a href="editpengguna.php?notabeli=<?php echo $row['notabeli']; ?>"
                    class="btn btn-info btn-sm text-white">Detail</a>
                <a href="editpengguna.php?notabeli=<?php echo $row['notabeli']; ?>"
                    class="btn btn-warning btn-sm">Ubah</a>
                <form method="post" action="" style="display:inline;"
                    onsubmit="return confirm('Yakin ingin menghapus data ini?');">
                    <input type="hidden" name="notabeli" value="<?php echo $row['notabeli']; ?>">
                    <input type="submit" name="delete" value="Hapus" class="btn btn-danger btn-sm">
                </form>
            </td>
        </tr>
        <?php } ?>
    </table>
</div>
<?php
} else {
    echo "<br><br><div class='alert alert-warning'>Tidak ada data pengguna.</div>";
}
?>
</div>