<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Aulas.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);
  $modalidades = getModalidadesByInstalacao($id);

  $title = "Lista de Horarios de Modalidades ou Horario Completo";
  include("templates/menu.php");

  include("templates/treino_aulas.php");


?>
