<?php
  require_once('config/init.php');
  require_once('database/reg.php');
  session_start();

  #access params from registratiton request

  $email = $_POST['email'];
  $mem_num = $_POST['mem_num'];
  $password = $_POST['password'];

  if(valoresValidos($mem_num,$email)){
    inserirtPass($password,$mem_num);
    $_SESSION["msg"] = "Registo efetuado com sucesso";
    header('Location: templates/login.php');
  } else {
    $_SESSION["msg"] = "Registo inválido, Número de Conta ou Email incorretos";
    header('Location: templates/register.php');
  }

  if(strlen($mem_num) == 0) {
    $_SESSION["msg"] = "Número de conta inválido";
    header('Location: templates/register.php');
    die();
  }

  if(strlen($password) < 8) {
    $_SESSION["msg"] = "Password não possui pelo menos 8 carateres";
    header('Location: templates/register.php');
    die();
  }
?>
