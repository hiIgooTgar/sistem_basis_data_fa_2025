<?php
require_once 'connect.php';
require_once 'header.php';
?>
<div class="container py-5" style="margin-top: 3rem;">
    <?php
    if (isset($_POST['addnew'])) {
        // Ambil data dari form
        $idkategori = $_POST['idkategori'];
        $nama_kategori = $_POST['nama_kategori'];

        // Validasi input
        if (empty($idkategori) || empty($nama_kategori)) {
            echo "<div class='alert alert-warning'>Seluruh data harus diisi!</div>";
        } else {
            // Query untuk memasukkan ke tabel kategori
            $sql = "INSERT INTO tbkategori (idkategori, nama_kategori) 
                    VALUES ('$idkategori', '$nama_kategori')";

            if ($con->query($sql) === TRUE) {
                header("Location: kategori.php");
                exit();
            } else {
                echo "<div class='alert alert-danger'>Data gagal ditambahkan: " . $con->error . "</div>";
            }
        }
    }
    ?>

    <div class="row">
        <div class="col-md-12">
            <h3 class="mb-4"><i class="glyphicon glyphicon-plus"></i>&nbsp;Tambah Kategori</h3>
            <div class="box">
                <form action="" method="POST">
                    <div class="row">
                        <div class="col-6">
                            <label class="form-label" for="idkategori">Id Kategori</label>
                            <input type="text" id="idkategori" name="idkategori" class="form-control"><br>

                        </div>
                        <div class="col-6">
                            <label class="form-label" for="nama_kategori">Nama Kategori</label>
                            <input type="text" id="nama_kategori" name="nama_kategori" class="form-control"><br>

                        </div>
                    </div>
                    <input type="submit" name="addnew" class="btn btn-primary" value="Tambah">
                    <a href="kategori.php" class="btn btn-danger">Batal</a>
                </form>
            </div>
        </div>
    </div>
</div>