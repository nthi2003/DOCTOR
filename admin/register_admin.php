<?php

include '../components/connect.php';

session_start();

if (isset($_POST['submit'])) {

    $name = $_POST['name'];
    $name = filter_var($name, FILTER_SANITIZE_STRING);
    $age = $_POST['age'];
    $age = filter_var($age, FILTER_SANITIZE_STRING);
    $sex = $_POST['sex'];
    $sex = filter_var($sex, FILTER_SANITIZE_STRING);
    $position = $_POST['position'];
    $position = filter_var($position, FILTER_SANITIZE_STRING);
    $phone = $_POST['phone'];
    $phone = filter_var($phone, FILTER_SANITIZE_STRING);

    $pass = sha1($_POST['pass']);
    $pass = filter_var($pass, FILTER_SANITIZE_STRING);
    $cpass = sha1($_POST['cpass']);
    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);


    if (isset($_FILES['image'])) {
        $image = $_FILES['image']['name'];
        $image_size = $_FILES['image']['size'];
        $image_tmp_name = $_FILES['image']['tmp_name'];
        $image_folder = '../uploaded_img/' . $image;
    } else {
        $image = null;
    }

    $select_admin = $conn->prepare("SELECT * FROM `doctor` WHERE name = ?");
    $select_admin->execute([$name]);
    $row = $select_admin->fetch(PDO::FETCH_ASSOC);

    if ($select_admin->rowCount() > 0) {
        $message[] = 'Tên đã tồn tại';
    } else {
        if ($pass != $cpass) {
            $message[] = 'mật khẩu xác nhận không khớp!';
        } else {
            $insert_admin = $conn->prepare("INSERT INTO `doctor` (name, age, sex, position, phone, password, image) VALUES (?, ?, ?, ?, ?, ?, ?)");

            if (isset($image)) {
                $insert_admin->execute([$name, $age, $sex, $position, $phone, $cpass, $image]);

                if ($image_size > 2000000) {
                    $message[] = 'Ảnh quá lớn Thay đổi ảnh bé hơn 2MB!';
                } else {
                    move_uploaded_file($image_tmp_name, $image_folder);
                }
            } else {

                $insert_admin->execute([$name, $cpass, null]);
            }

            $select_admin = $conn->prepare("SELECT * FROM `doctor` WHERE name = ? AND password = ?");
            $select_admin->execute([$name, $pass]);
            $row = $select_admin->fetch(PDO::FETCH_ASSOC);

            if ($select_admin->rowCount() > 0) {
                $_SESSION['IDDoctor'] = $row['IDDoctor'];
                header('location:dashboard.php');
            } else {
                $message[] = 'eo dang nhap dc';
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <link rel="stylesheet" href="../css/doctor.css">

</head>

<body>

    <?php
    if (isset($message)) {
        foreach ($message as $message) {
            echo '
      <div class="message">
         <span>' . $message . '</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
        }
    }
    ?>
    <section class=" form-container">

        <form action="" method="post" enctype="multipart/form-data">
            <h3>Register Now</h3>
            <input type="text" name="name" required placeholder="Enter your name" class="box" maxlength="50">
            <input type="text" name="age" required placeholder="Enter age" class="box" maxlength="50">
            <input type="text" name="sex" required placeholder="Enter your sex" class="box" maxlength="50">
            <input type="text" name="position" required placeholder="Enter your position" class="box" maxlength="50">
            <input type="text" name="phone" required placeholder="Enter your phone" class="box" maxlength="50">


            <input type="password" name="pass" required placeholder="Enter your password" class="box" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="password" name="cpass" required placeholder="Confirm your password" class="box" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">

            <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">

            <input type="submit" value="Register Now" name="submit" class="btn">

            <p>Already have an account? <a href="login.php">Login now</a></p>
        </form>

    </section>



    <!-- custom js file link  -->
    <script src="js/script.js"></script>

</body>

</html>