<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');

  $instalacao = $_GET['Instalacao'];

  $instalacao_info = getInstalacoesById($instalacao);

  include("templates/instalacao.php");

  $title = "Lista de Opções";
  include("templates/menu.php");

?>
