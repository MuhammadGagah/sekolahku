<?php

if (!isset($_GET['id']) || $_GET['id'] == '') header('Location: index.php');

require_once '../../koneksi.php';
$id = $_GET['id'];
$query = mysqli_query($koneksi, "SELECT foto FROM tbl_guru WHERE id = {$id}");
$row = mysqli_fetch_assoc($query);

if (file_exists("../../images/guru/" . $row['foto'])) unlink("../../images/guru/" . $row['foto']) or die('foto tidak bisa dihapus');

$query = mysqli_query($koneksi, "DELETE FROM tbl_guru WHERE id = {$id}");
if ($query) {
	$_SESSION['sukses'] = 'Data Berhasil Dihapus!';
	header('Location: index.php');
} else {
	$_SESSION['gagal'] = 'Data Gagal Dihapus!';
	header('Location: index.php');
}
