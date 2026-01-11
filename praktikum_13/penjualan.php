<?php
require_once 'connect.php';
require_once 'header.php';

echo "<div class='container'>";

// Proses penghapusan
if (isset($_POST['delete'])) {
    $nota = $_POST['nota'];
    $sql = "DELETE FROM tbpenjualan WHERE nota = '$nota'";
    if ($con->query($sql) === TRUE) {
        header("Location: penjualan.php");
        exit();
    } else {
        echo "<div class='alert alert-danger'>Gagal menghapus data</div>";
    }
}

// Ambil data penjualan
$sql = "SELECT p.nota, p.tgltransaksi, g.nama, m.namamember, p.total FROM tbpenjualan AS p
LEFT JOIN tbpengguna AS g ON p.id = g.id
LEFT JOIN tbmember AS m ON p.idmember = m.idmember
 order by nota";
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
            <th>Nota Penjualan</th>
            <th>Tanggal</th>
            <th>Nama Pengguna</th>
            <th>Nama Member</th>
            <th>Total</th>
            <th colspan=" 2">Aksi</th>
        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $row['nota']; ?></td>
            <td><?php echo $row['tgltransaksi']; ?></td>
            <td><?php echo $row['nama']; ?></td>
            <td><?php echo $row['namamember']; ?></td>
            <td><?php echo $row['total']; ?></td>
            <td>
                <a href="editpengguna.php?nota=<?php echo $row['nota']; ?>"
                    class="btn btn-info btn-sm text-white">Detail</a>
                <a href="editpengguna.php?nota=<?php echo $row['nota']; ?>" class="btn btn-warning btn-sm">Ubah</a>
                <form method="post" action="" style="display:inline;"
                    onsubmit="return confirm('Yakin ingin menghapus data ini?');">
                    <input type="hidden" name="nota" value="<?php echo $row['nota']; ?>">
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