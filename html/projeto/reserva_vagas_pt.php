<?php

require_once('config/init.php');
require_once('database/Vagas.php');
session_start();

if(!isset($_SESSION)) {
  session_start();
}

if(!isset($_SESSION['reserva'])) {
  $_SESSION['reserva'] = array();
}

//lugar a ser reservado
$vagas = $_POST['numero_de_vagas'];
$id_treino = $_POST['id_treino'];
$reserva = $_POST['reserva'];

if( $vagas == 1  && (strcmp($reserva, 'reserva') == 0)) {
  $vagas = 0;
  Vagas_PT_Atualizadas($vagas, $id_treino);
  insertReservaPT($_SESSION['num_conta'], $id_treino);
  $_SESSION['reserva'][$id_treino] = 't';
  //redirecionamento aonde o utilizador estava
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

else if(strcmp($reserva, 'cancelamento') == 0) {
  $vagas = 1;
  Vagas_PT_Atualizadas($vagas, $id_treino);
  deleteReservaPT($_SESSION['num_conta'], $id_treino);
  $_SESSION['reserva'][$id_treino] = 'f';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

$title = "Descricao do Treinador x";
include("templates/menu.php");

include("templates/descricao_pt.php");

?>
