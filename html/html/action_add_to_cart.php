<?php
  require_once('config/init.php');

  if(!isset($_SESSION)) {
    session_start();
  }

  if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
  }

    $numserie = $_POST['Num_serie'];

    $quantidade = 1;

    $_SESSION['numserie'] = $numserie;

    $_SESSION['cart'][$numserie] += $quantidade;

    header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
