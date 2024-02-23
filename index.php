<?php

require_once 'koneksi.php';
$query = mysqli_query($koneksi, "SELECT * FROM tbl_artikel");

$aktif = 'home';
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home - SLB Negeri 3 Martapura</title>
	<link rel="stylesheet" href="resources/fonts/stylesheet.css">
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/style.css">
</head>

<body>
	<div class="container bg-light">
		<!-- top bar -->
		<?php require_once 'topbar.php'; ?>
	</div>

	<!-- nav bar -->
	<?php require_once 'navbar.php'; ?>

	<!-- hero image -->
	<div class="hero">
		<img src="resources/images/banner_1.jpg" alt="">
	</div>

	<!-- content -->
	<div class="row p-3">
		<div class="col-md-8">
			<div class="title mb-3">
				Informasi Terbaru
			</div>
			<?php while ($artikel = mysqli_fetch_assoc($query)) : ?>
				<div class="artikel">
					<div class="info">
						<div class="post mb-2">
							<span class="tgl"><?= date('d M y', strtotime($artikel['tanggal'])) ?></span>
							<span class="judul"><a href="detail_artikel.php?id=<?= $artikel['id'] ?>"><?= $artikel['judul'] ?></a></span>
						</div>
					</div>
					<div class="detail">
						<div class="clearfix" style="text-align: justify;">
							<img src="images/artikel/<?= $artikel['foto'] ?>" alt="" width="200px" class="float-left mr-2">
							<?= substr($artikel['isi'], 0, 150) . '...' ?>
						</div>
					</div>
					<hr>
				</div>
			<?php endwhile; ?>
		</div>
		<?php require_once 'sidebar.php'; ?>
	</div>
	<div class="text-white footer">
		<?php echo "&copy; Copyright " . date("Y") . " SLB Negeri 3 Martapura."; ?>
	</div>
	</div>

	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>

</html>