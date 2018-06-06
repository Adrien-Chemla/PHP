<?php

  function db_connexion(){
    try {

      $host = "localhost";
      $db_name = "comptable";
      $user = "root";
      $password = "";

      $db = new PDO("mysql:host=" . $host . ";dbname=" . $db_name,$user,$password);
      return $db;

    } catch (Exception $e) {

      die("Erreur :" . $e->getMessage());

    }
  }

$db = db_connexion();

 ?>
