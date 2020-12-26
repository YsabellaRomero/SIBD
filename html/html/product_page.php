<?php
  require_once('config/init.php');
  require_once('database/ProductPage.php');

  $numserie = $_GET['numserie'];
  $category = $_GET['category'];

  $specs = getSepcsByProduct($category, $numserie);

  include('templates/header.php');
  include('templates/product.php');
?>
