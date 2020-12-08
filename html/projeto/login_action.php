<?php

  include("menu.php");

  $email = $_POST['email'];
  $pasword = $_POST['password'];

  // authenticate user

  echo "Hello $email! You are now logged in!";

?>
