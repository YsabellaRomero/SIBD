<?php
  require_once('config/init.php');
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

  #verificar se valores introduzidos são válidos

  function valoresValidos($mem_num,$email){
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Socio USING (NIF) WHERE numero_conta = (?) AND email = (?)');
    $stmt->execute(array($mem_num, $email));
    return $stmt->fetch();
  }

  #inserir password nova

  function inserirtPass($password,$mem_num) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Socio set password  = (?) where numero_conta = (?)');
    $stmt->execute(array(sha1($password), $mem_num));
  }

?>
