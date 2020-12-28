<?php
  require_once('config/init.php');
  require_once('database/log.php');
  session_start();

  if(!isset($_SESSION)) {
    session_start();
  }

  $email = $_POST['email'];
  $password = $_POST['password'];

  $res = loginValido($email,$password);

  if($res){
    $_SESSION["utilizador"] = $res['name'];
    $_SESSION["email"] = $res['email'];
    $_SESSION["local"] = $res['localizacao'];
    $_SESSION["local_id"] = $res['instalacao'];
    $_SESSION["msg"] = "Login com sucesso";
    header('Location: templates/index.php');
  } else {
    $_SESSION["msg"] = "Login falhou";
    header('Location: templates/login.php');
  }


?>
