<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');
  require_once('database/Aulas.php');
  require_once('database/Treinadores.php');
  require_once('database/Vagas.php');

  if(!isset($_SESSION)) {
    session_start();
  }

  if(!isset($_SESSION['reserva'])) {
    $_SESSION['reserva'] = array();
  }

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $id_treino = $_GET['id_treino'];
  $modalidade = getModalidade($id_treino);
  //var_dump($modalidade);

  $id_modalidade = $modalidade['id_modalidade'];
  $descricao = getDescricao($id_modalidade);
  $id_aula = $descricao[0]['ID_aula'];
  $treinador = getTreinador_Aula_ByOcorrencia($id_aula);

  if(getReservaAula($_SESSION['num_conta'], $id_aula)) {
    $_SESSION['reserva'][$id_aula] = 't';
  }

  else {
    $_SESSION['reserva'][$id_aula] = 'f';
  }

  $title = "Descricao da Aula x";
  include("templates/menu.php");

  include("templates/descricao_aula.php");

?>
