<?php
  require_once('config/init.php');

  include('database/Instalacoes.php');

  $instalacoes = getAllInstalacoes();

  $title = "Lista de Instalações";
  include("templates/menu.php");

  //include('templates/header.php');
  //include('templates/list_categories.php');
  //include('templates/footer.php');
?>
