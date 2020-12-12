<?php
  require_once('config/init.php');
  session_start();

  #access params from registratiton request

  $mem_num = $_POST['num_conta'];
  $password = $_POST['password'];

  #insert new password in

  function insertPass($password,$mem_num) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Socio set password  = (?) where numero_conta = (?)');
    $stmt->execute(array(sha1($password), $mem_num));
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

  try {
      insertPass($password,$mem_num);       //num_conta inexistente não dá erronão
      $_SESSION["msg"] = "Registration sucsessful";
      header('Location: login.php');
  } catch (Exception $e) {                  //não entra aqui
      $err_msg = $e->getMessage();

      if(strpos($err_msg, "UNIQUE")) {              // ESTE TESTE NÃO SE APLICA
        $_SESSION["msg"] = "Número do sócio não existe";
      } else {
        $_SESSION["msg"] = "Registo falhou";
      }
      header('Location: templates/register.php');
  }

?>
