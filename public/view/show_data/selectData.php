<?php session_start(); ?>
<?php

require_once '../../../app/config/config.php';

use AIS\database\database;
use AIS\posts\DataController;

require_once __DIR__ . ('/../../../vendor/autoload.php');
$db = new database("localhost", "admin", "saboor123", "thesis");
$dataCon = new DataController($db);
?>
<?php
require_once "../include/header.php";
?>
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
        <nav class="navbar navbar-expand-lg  ">
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
                            <a class="nav-link" href="../dashboard/dashboard.php">Dashboard</a>
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
        <div class="conainer pkl-box">
            <div class="letter-box">
                <form>
                    <select class="form-control " name="id_letter" id="id_letter">
                        <?php $datas = $dataCon->FetchData('eletter'); ?>
                        <option value="0">Pilih Surat</option>
                        <?php foreach ($datas as $data) { ?>
                            <option value="<?php echo ($data['id']); ?>">
                                <?php echo  ucwords($data['letters']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </form>
                <table class="table mt-2">
                    <tbody>
                        <?php $sql = "SELECT student.nim, name, lastname, email,country,
                                        MAX(class_grade) AS finalSemester,
                                        address FROM student
                                        INNER JOIN classes ON student.nim=classes.nim 
                                        WHERE student.nim =  '$id'
                                        GROUP BY classes.nim "; ?>
                        <?php $post = $db->select($sql); ?>
                        <?php while ($rows = $post->fetch_assoc()) { ?>
                            <tr>
                                <th scope="col">ID</th>
                                <td><?php echo $rows['nim']; ?></td>
                            </tr>
                            <tr>
                                <th scope="col">NAME</th>
                                <td><?php echo $rows['name']; ?></td>
                            </tr>
                            <tr>
                                <th scope="col">Email</th>
                                <td><?php echo $rows['email']; ?></td>
                            </tr>
                            <tr>
                                <th scope="col">Country</th>
                                <td><?php echo $rows['country']; ?></td>
                            </tr>
                            <tr>
                                <th scope="col">Semester</th>
                                <td><?php echo $rows['finalSemester']; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <!-- pkl from -->

            <div class="hidePKL box">
                <div class="close-box">
                    <h5>PKL form</h5>
                    <h5 class="closePKLForm" aria-haspopup="true">x</h5>
                </div>
                <form id="pklform">
                    <div class="form-group">
                        <input type="text" class="form-control" name="agencyTitle" id="agencyTitle" placeholder="Agency Details" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="agencyID" id="agencyID" value="<?php echo $_SESSION['nim']; ?>" placeholder="Student ID" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <textarea name="agencryDescription" id="agencryDescription" class="form-control" rows="5" placeholder="To"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="number" name="lengthOmonth" id="lengthOmonth" class="form-control" placeholder="Length the month" autocomplete="off">
                    </div>
                    <div class="row">
                        <div class="col-sm-6 ">
                            <label for="datepicker1">From</label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="datepicker1" id="datepicker1" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="datepicker2">To</label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="datepicker2" id="datepicker2" autocomplete="off">
                            </div>
                        </div>

                    </div>
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <select class="form-control" id="typesofAgencyLetter" name="typesofAgencyLetter">
                                <option value="0">Type of Letter</option>
                                <option value="Electronic"> Electronic</option>
                                <option value="Manual">Manual</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="pklsubmitBnt" id="pklsubmitBnt" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>

            <!-- end pkl surat -->

            <div class="hideRecommendationScholarshipLetter box">
                <div class="close-box">
                    <h5 style="font-size: 16px;">Scholarship Recommendation Letter</h5>
                    <h5 class="closePKLForm">x</h5>
                </div>
                <form id="activeletterform">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="recommendationId" id="recommendationId" value="<?php echo $_SESSION['nim']; ?>" placeholder="Student ID" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <textarea name="activeRecommendationLetter" id="activeRecommendationLetter" class="form-control" rows="5" placeholder="Scholarship Recommendation Letter"></textarea>
                    </div>
                    <select name="" id="recommendationOption" class="form-control">
                        <option value="0">Type of Letter</option>
                        <option value="Electronic"> Electronic</option>
                        <option value="Manual">Manual</option>
                    </select>
                    <div class="form-group btn-footer">
                        <button type="submit" name="recommendationScholarshipBtn" id="recommendationScholarshipBtn" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
            <!-- end active letter -->
        </div>
        <div class="custome-alert">

        </div>
        <!-- this reset of the project can be added here -->
    </div>
</div>

<script src="../../inc/js/jquery.min.js"></script>
<script src="../../inc/js/fill_Eletter.js"></script>
<?php
require_once '../include/footer.php';
?>