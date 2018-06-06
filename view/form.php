<?php
session_start()
require ('sql.php');

  global $db;

  if (isset($_POST['submitRegistration'])) {
    if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
      $error = "Mail incorrect";
    }
    else if(strlen($_POST['first_name']) == 0 && strlen($_POST['first_name']) > 35) {
      $error = "Prénom incorrect";
    }
    else if(strlen($_POST['last_name']) == 0 && strlen($_POST['last_name']) > 35) {
      $error = "Nom incorrect";
    }
    else if(strlen($_POST["tel"]) > 10) {
      $error = "Téléphone incorrect";
    }
    else {
      $req = $db->prepare("INSERT INTO user (first_name, last_name, tel, email, password) VALUES(:first_name, :last_name, :tel, :email, :password)");
      $req->execute(array(
              "first_name"      => $_POST['first_name'],
              "last_name"       => $_POST['last_name'],
              "tel"             => intval($_POST['tel']),
              "email"           => $_POST['email'],
              "password"        => $_POST['password']));

      header("Location: ../login.php");
    }

    isset($error) ? header("Location: ../login.php?login=" . $error) : false;
  }

  if (isset($_POST['submitUser'])) {
    $req = $db->prepare("SELECT * FROM user WHERE email = :email AND password = :password");
    $req->execute(array(
            "email"     => $_POST['email'],
            "password"  => $_POST['password']));

    if($req->rowCount() == 1) {
      $_SESSION['access'] = true;
      header("Location: ../index.php");
    }
    else {
      header("Location: ../login.php?return=error");
    }
  }

 ?>
