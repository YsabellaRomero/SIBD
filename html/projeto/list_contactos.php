<?php

  require_once('config/init.php');
  require_once('database/Contactos.php');
  require_once('database/Instalacoes.php');

  $id = $_GET['id'];

  $localizacao = getInstalacoesById($id);
  $contactos = getContactosByInstalacao($id);

  $title = "Contactos da Instalação x";
  include('templates/menu.php');
  include('templates/contactos.php');

?>
