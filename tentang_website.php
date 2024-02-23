<?php

require_once 'koneksi.php';

$query = mysqli_query($koneksi, "SELECT * FROM tbl_tentang_website WHERE id = 1");
$tentang_website = mysqli_fetch_assoc($query);
$aktif = 'tentang_website';
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Detail Website - SLB Negeri 3 Martapura</title>
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

	<!-- content -->
	<div class="row p-3">
		<div class="col-md-8">
			<div class="title mb-3">
				Tentang Website SLB Negeri 3 Martapura
			</div>
			<div class="artikel">
				<?= $tentang_website['tentang_website'] ?>
			</div>
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