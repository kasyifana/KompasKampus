<?php
include 'koneksi.php';

$query = "SELECT * FROM gaya_belajar";
$result = mysqli_query($koneksi, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Style - Kompas Kampus</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <?php include 'navbar.php'; ?>

    <!-- Main Content -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Gaya Belajar</h2>
        <div class="row">
            <?php while($row = mysqli_fetch_assoc($result)) { ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row['nama_gaya']; ?></h5>
                            <p class="card-text"><?php echo $row['deskripsi']; ?></p>
                            <h6>Karakteristik:</h6>
                            <p class="card-text"><?php echo $row['karakteristik']; ?></p>
                            <h6>Cara Belajar yang Sesuai:</h6>
                            <p class="card-text"><?php echo $row['cara_belajar']; ?></p>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>

    <!-- Footer -->
    <?php include 'footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
