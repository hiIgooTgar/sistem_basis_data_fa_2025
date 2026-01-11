<?php

$localhost	= "localhost";
$username	= "root";
$password	= "";
$dbname		= "24sa11a159_ampu_sport";

$con = new mysqli($localhost, $username, $password, $dbname);

if ($con->connect_error) {
	die("Gagal Koneksi : " . $conn->connect_error);
}