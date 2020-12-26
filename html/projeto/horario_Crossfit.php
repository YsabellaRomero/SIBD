<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $id_modalidade = $_GET['id_modalidade'];

  $title = "Horário Crossfit";
  include("templates/menu.php");

  include("templates/horario_Crossfit.php");

?>
