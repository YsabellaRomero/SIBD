<?php
  require_once('config/init.php');

  $email = $_POST['email'];
  $password = $_POST['password'];
  $nif = $_POST['nif'];
  $nome = $_POST['nome'];
  $num_telefone = $_POST['num_telefone'];

  if(!empty($email) && !empty($password) && !empty($nif) && !empty($nome) && !empty($num_telefone)) {
    $stmt = $dbh->prepare('SELECT COUNT(*) FROM Conta WHERE Email = ?');
    $stmt->execute(array($email));

    if($stmt->fetchColumn()) {
      header("Location: templates/register.php");
    }

    else {
      $ca = $dbh->prepare('INSERT INTO Conta(Email, Password, NIF, Nome, Num_telefone) VALUES(? , ?, ?, ?, ?)');
      $ca->execute(array($email, $password, $nif, $nome, $num_telefone));
      header("Location: templates/login.php");
    }
  }
?>
