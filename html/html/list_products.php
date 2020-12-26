<?php
  require_once('config/init.php');
  require_once('database/ProductList.php');

  $category = $_GET['category'];

  $products = getProductsByCategory($category);

  include('templates/header.php');
  include('templates/category.php');
?>
