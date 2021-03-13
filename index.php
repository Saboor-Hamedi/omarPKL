
<?php include('public/inc/header.php'); ?>
<?php
session_start();
$nim = '';
$pass = '';
$message = '';
$errors = array();
if (isset($_POST['submit'])) {
    $nim = mysqli_real_escape_string($db->link, $_POST['nim']);
    $pass = mysqli_real_escape_string($db->link, $_POST['password']);
    if (empty($_POST['nim'])) {
        array_push($errors, 'ID required');
    } else {
        $nim = $login->validate($_POST['nim']);
    }
    if (empty($_POST['password'])) {
        array_push($errors, 'Password required');
    } else {
        $pass = $login->validate($_POST['password']);
    }
    $login->Login($nim, $pass);
    // $message = $login->error;
    array_push($errors, $login->error);
}
?>
<section class="main-section">
    <div class="container custom-container ">
        <div class="row row-card">
            <div class="card-wrapper">
                <div class="brand">
                    <!-- <img src="img/logo.jpg" alt="logo"> -->
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Login (FST)</h4>
                        <p>Science And Teachnology</p>
                        <div class="alert alert-danger" role="alert">
                            <ul>
                                <?php if (count($errors) > 0) : ?>
                                    <?php foreach ($errors as $error) : ?>
                                        <li>
                                            <?php echo $error; ?>
                                        </li>
                                    <?php endforeach; ?>
                                <?php endif ?>
                            </ul>
                        </div>
                        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" class="my-login-validation" novalidate="">
                            <div class="form-group">
                                <label for="email">NIM - Your ID</label>
                                <input id="email" type="text" class="form-control" name="nim" value="<?php echo htmlspecialchars($_POST['nim'] ?? '', ENT_QUOTES) ?>" required autofocus>
                            </div>

                            <div class="form-group">
                                <label for="password">
                                    Your password
                                </label>
                                <input id="password" type="password" class="form-control" name="password" required data-eye>
                                <div class="invalid-feedback">
                                    Password is required
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-checkbox custom-control">
                                    <input type="checkbox" name="remember" id="remember" class="custom-control-input">
                                    <label for="remember" class="custom-control-label">Remember Me</label>
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" name="submit" id="submit" class="btn btn-primary btn-block">
                                    Login
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                Don't have an account? <a href="#">Create One</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="footer">
                    <!-- Top of the sidebar -->
                    <p class="text-center">
                        Copyright &copy; 2021 &mdash; E-Letter
                    </p>
                   
                </div>
            </div>
        </div>
    </div>
</section>

<?php include('public/inc/footer.php'); ?>