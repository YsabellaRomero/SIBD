<?php

  require_once('database/Contactos.php');

  $instalacao = $_GET['Instalacao'];

  $contactos = getInstalacoesById($instalacao);

  $products = getContactosByInstalacao($instalacao);

  include('templates/menu.php');
  //include('templates/header.php');
  //include('templates/list_products.php');
  //include('templates/footer.php');
?>
