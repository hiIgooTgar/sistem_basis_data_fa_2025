<?php
require_once 'connect.php';
require_once 'header.php';

echo "<div class='container'>";

// Proses penghapusan
if (isset($_POST['delete'])) {
    $id = $_POST['idmember'];
    $sql = "DELETE FROM tbmember WHERE idmember = '$id'";
    if ($con->query($sql) === TRUE) {
        header("Location: member.php");
        exit();
    } else {
        echo "<div class='alert alert-danger'>Gagal menghapus data</div>";
    }
}

// Ambil data member
$sql = "SELECT * FROM tbmember order by idmember";
$result = $con->query($sql);

if ($result->num_rows > 0) {
?>
<div class="container py-5" style="margin-top: 3rem;">
    <h2>Data Member</h2>
    <p>Aplikasi Ampu Sport - Peralatan Olahraga</p>
    <br>
    <a href="insertmember.php" class="btn btn-primary">Tambah Data</a>
    <br><br>

    <table class="table table-bordered table-striped">
        <tr>
            <th>Id Member</th>
            <th>Nama Member</th>
            <th>Alamat</th>
            <th>Telp</th>
            <th colspan="2">Aksi</th>
        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $row['idmember']; ?></td>
            <td><?php echo $row['namamember']; ?></td>
            <td><?php echo $row['alamat']; ?></td>
            <td><?php echo $row['telp']; ?></td>
            <td>
                <a href="editkategori.php?id=<?php echo $row['idmember']; ?>" class="btn btn-warning btn-sm">Ubah</a>
                <form method="post" action="" style="display:inline;"
                    onsubmit="return confirm('Yakin ingin menghapus data ini?');">
                    <input type="hidden" name="id" value="<?php echo $row['idmember']; ?>">
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