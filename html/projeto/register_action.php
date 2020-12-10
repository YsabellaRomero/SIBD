<?php

  $dbh = new PDO('sqlite:./sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  /*//verificar se utilizador já está na base de DADOS

  $mem_num = $_GET['XXXXX1'];
  $mail = $_GET['XXXXX2'];

  $stmt = $dbh->prepare('SELECT * from Dados_Utilizador WHERE XXXXX2=?');
  $stmt->execute(array($XXXXX1));
  $???????? = $stmt->fetch() ou fetchAll();*/


  $mem_num = $_POST['mem_num'];
  $password = $_POST['password'];


  // authenticate user
  function insertPass($password,$mem_num) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Socio set password  = (?) where ID = (?)');
    $stmt->execute(array($password, $mem_num));
    //var_dump($password);
    //var_dump($mem_num);
  }
  insertPass($password,$mem_num);

  header('Location: login.php');

  include("menu.php");

  //echo "Hello $email! You are now logged in!";

?>
