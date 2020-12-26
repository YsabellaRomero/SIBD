<?php
  require_once('config/init.php');
  require_once('database/ProfilePage.php');

  if(!isset($_SESSION)) {
    session_start();
  }

  $emailconta = $_SESSION['emailconta'];
  $clientinfo = getClientInfo($emailconta);

  include('templates/header.php');
  include('templates/profile.php');
?>
