<?php
  session_start();

  $dbh = new PDO('sqlite:./sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  #access params from registratiton request

  $mem_num = $_POST['mem_num'];
  $password = $_POST['password'];

  /*//verificar se utilizador já está na base de DADOS

  $mem_num = $_GET['XXXXX1'];
  $mail = $_GET['XXXXX2'];

  $stmt = $dbh->prepare('SELECT * from Dados_Utilizador WHERE XXXXX2=?');
  $stmt->execute(array($XXXXX1));
  $???????? = $stmt->fetch() ou fetchAll();*/

  #insert new password in

  function insertPass($password,$mem_num) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Socio set password  = (?) where numero_conta = (?)');
    $stmt->execute(array(sha1($password), $mem_num));
  }

    if(strlen($mem_num) == 0) {
      $_SESSION["msg"] = "Número de conta inválido";
      header('Location: register.php');
      die();
    }

    if(strlen($password) < 8) {
      $_SESSION["msg"] = "Password não possui pelo menos 8 carateres";
      header('Location: register.php');
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
      header('Location: register.php');
  }

?>
