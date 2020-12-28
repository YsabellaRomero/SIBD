<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');
  require_once('database/Aulas.php');
  require_once('database/Treinadores.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $id_treino = $_GET['id_treino'];
  $modalidade = getModalidade($id_treino);
  //var_dump($modalidade);

  $id_modalidade = $modalidade['id_modalidade'];
  $descricao = getDescricao($id_modalidade);
  $id_aula = $descricao[0]['ID_aula'];
  $treinador = getTreinador_Aula_ByOcorrencia($id_aula);

  $title = "Descricao da Aula x";
  include("templates/menu.php");

  include("templates/descricao_aula.php");

?>
