<?php
  if(!isset($_SESSION)) {
    session_start();
  }

  require_once('config/init.php');
  require_once('database/UpdateData.php');

  $datafield = $_GET['data'];
  $email = $_SESSION['emailconta'];

  switch($datafield) {
    case 'Nome':
      $param = $_POST['nome'];
      UpdateData($datafield, $param, $email);
      break;

    case 'NIF':
      $param = $_POST['nif'];
      UpdateData($datafield, $param, $email);
      break;

    case 'Num_telefone':
      $param = $_POST['Num_telefone'];
      UpdateData($datafield, $param, $email);
      break;

    case 'Password':
      $oldpw = $_POST['oldpw'];
      $param = $_POST['newpw'];

      $pwcheck = CheckPassword($email);

      if(strcmp($pwcheck['Password'], $oldpw) == 0) {
        UpdateData($datafield, $param, $email);
      }
      
      break;
  }

  include('action_profile.php');
 ?>
