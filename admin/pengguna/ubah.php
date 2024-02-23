<?php

if (!isset($_GET['id']) || $_GET['id'] == '') header('Location: index.php');

require_once '../../koneksi.php';
$id = $_GET['id'];
$query = mysqli_query($koneksi, "SELECT * FROM tbl_pengguna WHERE id = $id");
$pengguna = mysqli_fetch_assoc($query);

$active = 'master';
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Ubah Data Pengguna - Web SLB Negeri 3 Martapura</title>
	<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
</head>

<body>
	<?php require_once '../navbar.php'; ?>
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header">
						<div class="clearfix">
							<div class="float-left">
								Ubah Data Pengguna
							</div>
							<div class="float-right">
								<a href="index.php">Kembali</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<form method="POST" action="proses_ubah.php?id=<?php echo $id; ?>" enctype="multipart/form-data">
							<div class="form-group">
								<label for="nama">Nama</label>
								<input type="text" value="<?php echo $pengguna['nama'] ?>" class="form-control" id="nama" placeholder="nama" autocomplete="off" required="required" name="nama">
							</div>
							<div class="form-group">
								<label for="username">Username</label>
								<input type="text" value="<?php echo $pengguna['username'] ?>" class="form-control" id="username" placeholder="username" autocomplete="off" required="required" name="username">
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="password">Password Baru</label>
										<input type="password" class="form-control" id="password" placeholder="password baru" autocomplete="off" name="password">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="foto">Foto</label>
										<input type="file" class="form-control-file mb-2" id="foto" autocomplete="off" name="foto">
									</div>
									*foto sebelumnya <br>
									<img src="../../images/pengguna/<?= $pengguna['foto'] ?>" alt="" width="20%" class="img-thumbnail mt-2">
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-sm btn-primary" name="ubah">Simpan perubahan</button>
									<button type="reset" class="btn btn-sm btn-danger" onclick="return confirm('apakah anda yakin?')">Batal</button>
									<a href="index.php" class="btn btn-sm btn-secondary">Kembali</a>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../resources/js/jquery.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
</body>

</html>