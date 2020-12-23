<?php
  require_once('config/init.php');
  session_start();

  if(!isset($_SESSION)) {
    session_start();
  }

  $email = $_POST['email'];
  $password = $_POST['password'];

  function loginValido($email,$password){
    global $dbh;
    $stmt = $dbh->prepare('SELECT name FROM Pessoa JOIN Socio USING (NIF) WHERE email = (?) AND password = (?)');
    $stmt->execute(array($email, sha1($password)));
    return $stmt->fetch();          //devolve a coluna ou false
  }

  $res = loginValido($email,$password);
  
  if($res){
    $_SESSION["utilizador"] = $res['name'];
    $_SESSION["msg"] = "Login com sucesso";
    header('Location: templates/index.php');
  } else {
    $_SESSION["msg"] = "Login falhou";
    header('Location: templates/login.php');
  }


?>
