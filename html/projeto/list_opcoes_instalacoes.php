<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Treinadores.php');


  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $title = "Lista de Opções";
  include("templates/menu.php");

  include("templates/instalacao.php");

?>
