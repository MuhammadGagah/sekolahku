<?php

if (!isset($_POST['ubah'])) header('Location: ubah.php');

require_once '../../koneksi.php';
$id = $_GET['id'];

$nama = mysqli_real_escape_string($koneksi, isset($_POST['nama']) ? $_POST['nama'] : '');
$username = mysqli_real_escape_string($koneksi, isset($_POST['username']) ? $_POST['username'] : '');
$password_input = mysqli_real_escape_string($koneksi, isset($_POST['password']) ? $_POST['password'] : '');

// persiapan upload foto
if ($_FILES['foto']['error'] == 0) {
	$ekstensi = pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION);
	$nama_foto = strtolower(str_replace(' ', '-', $nama)) . '.' . $ekstensi;
	$asal = $_FILES['foto']['tmp_name'];
} else {
	// hapus foto sebelumnya
	$query_pengguna = mysqli_query($koneksi, "SELECT foto FROM tbl_pengguna WHERE id = $id");
	$row = mysqli_fetch_assoc($query_pengguna);
	$nama_foto = $row['foto'];
}

$tujuan = '../../images/pengguna/';

// Check apakah pengguna mengubah password
if (!empty($password_input)) {
	$password = password_hash($password_input, PASSWORD_DEFAULT);
	$query = mysqli_prepare($koneksi, "UPDATE tbl_pengguna SET nama = ?, username = ?, password = ?, foto = ? WHERE id = ?");
	mysqli_stmt_bind_param($query, 'ssssi', $nama, $username, $password, $nama_foto, $id);
} else {
	$query = mysqli_prepare($koneksi, "UPDATE tbl_pengguna SET nama = ?, username = ?, foto = ? WHERE id = ?");
	mysqli_stmt_bind_param($query, 'sssi', $nama, $username, $nama_foto, $id);
}

if ($_FILES['foto']['error'] == 0) {
	if ($_FILES['foto']['size'] < 1000000) {
		if (file_exists($tujuan . $nama_foto)) unlink($tujuan . $nama_foto);

		move_uploaded_file($asal, $tujuan . $nama_foto) or die('gagal upload foto');

		mysqli_stmt_execute($query);

		if (mysqli_stmt_affected_rows($query) > 0) {
			$_SESSION['sukses'] = 'Data Berhasil Diubah!';
			header('Location: index.php');
		} else {
			$_SESSION['gagal'] = 'Data Gagal Diubah!';
			header('Location: index.php');
		}
		mysqli_stmt_close($query);
	} else {
		$_SESSION['gagal'] = 'Ukuran gambar tidak boleh lebih dari 1000kb!';
		header('Location: index.php');
	}
} else {
	// ubah data tanpa memperbarui foto
	mysqli_stmt_execute($query);

	if (mysqli_stmt_affected_rows($query) > 0) {
		$_SESSION['sukses'] = 'Data Berhasil Diubah!';
		header('Location: index.php');
	} else {
		$_SESSION['gagal'] = 'Data Gagal Diubah!';
		header('Location: index.php');
	}
	mysqli_stmt_close($query);
}
