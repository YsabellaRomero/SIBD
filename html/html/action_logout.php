<?php
  session_start();
  require_once('config/init.php');

  if(isset($_SESSION) && $_SESSION['loggedin'] == true) {
    $_SESSION['loggedin'] = false;
    header("Location: templates/homepage.php");
  }
?>
