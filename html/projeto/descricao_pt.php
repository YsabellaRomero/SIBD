<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');
  require_once('database/Treinadores.php');
  require_once('database/Treino.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $nif = $_GET['nif'];
  $treinador = getAllInfo($nif);

  $id_treino = $_GET['id_treino'];
  $pt = getTreino_IndividualByTreino($id_treino);

  $title = "Descricao do Treinador x";
  include("templates/menu.php");

  include("templates/descricao_pt.php");

?>
