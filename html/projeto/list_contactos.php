<?php
  require_once('sql/init.php');

  require_once('database/Instalacoes.php');
  require_once('database/Contactos.php');

  $id = $_GET['id'];

  if (!isset($id))
    die(header('Location: list_contactos.php'));

  $category = getInstalacoesById($id);

  if (!$category)
    die(header('Location: list_contactos.php'));

  $products = getContactosByInstalacao($id);

  include('templates/menu.php');
  //include('templates/header.php');
  //include('templates/list_products.php');
  //include('templates/footer.php');
?>
