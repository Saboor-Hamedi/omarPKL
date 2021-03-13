<?php session_start(); ?>
<?php
require_once '../../../app/config/config.php';

use AIS\database\database;
use AIS\helper\help;
use AIS\posts\DataController;

require_once __DIR__ . ('/../../../vendor/autoload.php');
$db = new database("localhost", "admin", "saboor123", "thesis");
$helper = new help();
$dataCon = new DataController($db);
?>
<?php require_once('../include/header.php'); ?>
<?php $id = ''; ?>
<?php
if ($_SESSION['nim'] === NULL) {
header('Location: /');
}
?>
<?php $id = $_SESSION['nim']; ?>
<div class="wrapper">
<!-- Sidebar  -->
<nav id="sidebar">
<div class="sidebar-header">
<?php $datas = $dataCon->Fetch("student"); ?>
<?php foreach ($datas as $data) { ?>
<div class="card" style="text-align: center;">
<img class="card-img-top" style="height: 150px;" src="../../images/profile.png" alt="No profile image">
<div class="card-body">
    <h5 class="card-title"><?php echo $data['nim'] ?></h5>
    <p class="card-text"><?php echo $data['name']; ?></p>
</div>
</div>
<?php } ?>
</div>

<ul class="list-unstyled ">
<li class="active">
<a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
<ul class="collapse list-unstyled" id="homeSubmenu">
<li>
    <a href="../../view/show_data/selectData.php">Correspondence</a>
</li>
<li>
    <a href="#">Home 2</a>
</li>
<li>
    <a href="#">Home 3</a>
</li>
</ul>
</li>

</ul>
<!-- buttons -->
</nav>
<!-- Page Content  -->
<div id="content">
<nav class="navbar navbar-expand-lg">
<div class="container-fluid">
<button type="button" id="sidebarCollapse" class="btn btn-info">
<i class="fas fa-align-left"></i>
<!-- <span>Toggle Sidebar</span> -->
</button>
<button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<i class="fas fa-align-justify"></i>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="nav navbar-nav ml-auto">
    <li class="nav-item active">
        <a class="nav-link" href="../dashboard/dashboard.php">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Page</a>
    </li>
    <li class="nav-item">

        <a class="nav-link" href="#"><?php echo $id; ?></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../logout/logout.php">
            <i class="fas fa-sign-out-alt"></i>
        </a>
    </li>
</ul>
</div>
</div>
</nav>

<!-- top card -->



<!-- end top card -->
<div class="line">

</div>
<!-- show e-letters -->
<div class="show-e-letter">
<div class="box-show-e-letter">
<div class="first-box box-e-letter">
<div class="e-letter-header">
    <h4>Submission of Letters</h4>
</div>
<div class="e-letter-footer">
    <?php $query = "SELECT (select count(*) from recommendationletter) as t1_amount,
                (select count(*) from agency) as t2_amount "; ?>
    <?php $result = $db->link->query($query); ?>
    <?php while ($rows = $result->fetch_assoc()) { ?>
        <h4><?php echo $rows['t1_amount'] + $rows['t2_amount']; ?></h4>
    <?php    }   ?>

    <!-- ========== -->

</div>
</div>
<div class="second-box box-e-letter">
<div class="e-letter-header">
    <h4>Types of Letters</h4>
</div>
<div class="e-letter-footer">
    <?php $query = "SELECT letters, COUNT(letters) AS countLetters FROM eletter "; ?>
    <?php $result = $db->link->query($query); ?>
    <?php if ($result->num_rows <= 0) { ?>
        <h4>0</h4>
    <?php } else { ?>
        <?php while ($rows = $result->fetch_assoc()) { ?>
            <h4><?php echo $rows['countLetters']; ?></h4>
        <?php    }   ?>
    <?php } ?>
</div>
</div>
<!-- ----------------------- -->
<div class="third-box box-e-letter">
<div class="e-letter-header">
    <h4>Total of Students</h4>
</div>
<div class="e-letter-footer">
    <?php $query = "SELECT nim, COUNT(nim) AS totalOfStudents FROM student "; ?>
    <?php $result = $db->link->query($query); ?>
    <?php if ($result->num_rows <= 0) { ?>
        <h4>0</h4>
    <?php } else { ?>
        <?php while ($rows = $result->fetch_assoc()) { ?>
            <h4><?php echo $rows['totalOfStudents']; ?></h4>
        <?php } ?>
    <?php } ?>
</div>
</div>
<div class="fourth-box box-e-letter">
<div class="e-letter-header">
    <h4>Total of Lecturer</h4>
</div>
<div class="e-letter-footer">
    <?php $query = "SELECT teacherid, COUNT(teacherid) AS countteacher FROM teacher "; ?>
    <?php $result = $db->link->query($query); ?>
    <?php if ($result->num_rows <= 0) { ?>
        <h4>0</h4>
    <?php } else { ?>
        <?php while ($rows = $result->fetch_assoc()) { ?>
            <h4><?php echo $rows['countteacher']; ?></h4>
        <?php } ?>
    <?php } ?>
</div>
</div>
</div>
</div>

<!-- show e-letters end -->

<div class="e-letter-table">
<h2>Your Current Letters</h2>
<div class="table-e-letter">
<table class="table">
<thead>
    <tr>
        <th scope="col">No</th>
        <th scope="col">Description</th>
        <th scope="col">Date</th>
        <th scope="col">Type</th>
        <th scope="col">Delete</th>
    </tr>
</thead>
<tbody>
    <?php $datas = $dataCon->fetchLetter('agency', $id); ?>
    <?php foreach ($datas as $data) { ?>
        <tr>
            <td><?php echo $helper->increment(); ?></td>
            <td><?php echo $helper->loadMore($data['agencydescription'], 40); ?></td>
            <td><?php echo date('d F Y ', strtotime($data['start_time'])); ?></td>
            <td><?php echo ucfirst($data['lettertype']); ?></td>
            <td>
                <a href="#" id="<?php echo $data['id'] ?>" class="deleteletter">
                    <i class="fas fa-trash-alt btn btn-danger btn-sm"></i>
                </a>
            </td>
        </tr>
    <?php } ?>
    <!-- Recommendation letter -->
    <?php $datas = $dataCon->fetchLetter('recommendationletter', $id); ?>
    <?php foreach ($datas as $data) { ?>
        <tr>
            <td><?php echo $helper->increment(); ?></td>
            <td><?php echo $helper->loadMore($data['description'], 40); ?></td>
            <td><?php echo date('d F Y ', strtotime($data['create_at'])); ?></td>
            <td><?php echo ucfirst($data['lettertype']); ?></td>
            <td>
                <a href="#" id="<?php echo $data['id'] ?>" class="deleteRecommendationLetter">
                    <i class="fas fa-trash-alt btn btn-danger btn-sm"></i>
                </a>
            </td>
        </tr>
    <?php } ?>
</tbody>
</table>
</div>
</div>
</div>
</div>
<?php require_once('../include/footer.php'); ?>