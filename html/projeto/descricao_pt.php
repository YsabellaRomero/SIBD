<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');
  require_once('database/Modalidades.php');
  require_once('database/Treinadores.php');
  require_once('database/Treino.php');
  require_once('database/Vagas.php');

  if(!isset($_SESSION)) {
    session_start();
  }

  if(!isset($_SESSION['reserva'])) {
    $_SESSION['reserva'] = array();
  }

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $th = $_GET['th'];

  $nif = $_GET['nif'];
  $treinador = getAllInfo($nif);

  $id_treino = $_GET['id_treino'];
  $pt = getTreino_IndividualByTreino($id_treino);

  if(getReservaPT($_SESSION['num_conta'], $pt[0]['ID'])) {
    $_SESSION['reserva'][$pt[0]['ID']] = 't';
  }

  else {
    $_SESSION['reserva'][$pt[0]['ID']] = 'f';
  }

  $title = "Descricao do Treinador x";
  include("templates/menu.php");

  include("templates/descricao_pt.php");

?>
