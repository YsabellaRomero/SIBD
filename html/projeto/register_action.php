<?php

  $dbh = new PDO('sqlite:sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  include("menu.php");

  /*//verificar se utilizador já está na base de DADOS

  $mem_num = $_GET['XXXXX1'];
  $mail = $_GET['XXXXX2'];

  $stmt = $dbh->prepare('SELECT * from Dados_Utilizador WHERE XXXXX2=?');
  $stmt->execute(array($XXXXX1));
  $???????? = $stmt->fetch() ou fetchAll();*/


  $mem_num = $_POST['mem_num'];
  $email = $_POST['email'];
  $pasword = $_POST['password'];

  // authenticate user
  function insertUser($password) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Dados_Utilizador set password values (?) where numero_conta = (?))');
    $stmt->execute(array($password, $mem_num));
  }
  insertUser($password);

  echo "Hello $email! You are now logged in!";

?>
