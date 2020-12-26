<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $id_treino = $_GET['id_treino'];
  $modalidade = getModalidade($id_treino);

  $title = "Horário Cardio";
  include("templates/menu.php");

  include("templates/horario_Cardio.php");

?>
