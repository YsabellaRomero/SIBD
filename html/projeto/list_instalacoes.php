<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');

  $instalacoes = getAllInstalacoes();

  include("templates/list_instalacoes.php");


  $title = "Lista de Instalações";
  include("templates/menu.php");

?>
