<?php
  require_once('config/init.php');
  require_once('database/ProductList.php');

  if(!isset($_SESSION)) {
    session_start();
  }

  $numserie = $_SESSION['numserie'];

  $Artigos = array();

  foreach ($_SESSION['cart'] as $numserie => $quantity) {
    $Artigo = getProductByNumSerie($numserie);
    $Artigo['quantity'] = $quantity;
    $Artigos[] = $Artigo;
  }

  include('templates/header.php');
  include('templates/cart.php');
?>
