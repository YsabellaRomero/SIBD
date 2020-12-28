<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Treinadores.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $NIF = $_GET['nif'];
  $treinador = getAllInfo($NIF);

  $title = "Lista de Treinadores";
  include("templates/menu.php");

  include("templates/info_treinador3.php");

?>
