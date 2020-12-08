<?php

  include("menu.php");

  $mem_num = $_POST['mem_num'];
  $email = $_POST['email'];
  $pasword = $_POST['password'];

  // authenticate user

  echo "Hello $email! You are now logged in!";

?>
