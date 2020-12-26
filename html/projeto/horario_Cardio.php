<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');
  //require_once('database/Aulas.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $id_modalidade = $_GET['id_modalidade'];
  //var_dump($id_modalidade);
  $modalidade = getModalidade($id_modalidade);
  //var_dump($modalidade);

  $title = "Horário Cardio";
  include("templates/menu.php");

  include("templates/horario_Cardio.php");

?>
