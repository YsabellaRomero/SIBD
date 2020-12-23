<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Treinadores.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);
  $treinadores = getTreinadorByInstalacao($id);

  $title = "Lista de Treinadores";
  include("templates/menu.php");

  include("templates/treino_pt.php");


?>
