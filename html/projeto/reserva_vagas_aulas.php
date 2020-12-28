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
$id_aula = $_POST['id_aula'];
$reserva = $_POST['reserva'];

if( $vagas > 0 && (strcmp($reserva, 'reserva') == 0)) {
  $vagas -= 1;
  Vagas_Aulas_Atualizadas($vagas, $id_aula);
  insertReservaAula($_SESSION['num_conta'], $id_aula);
  $_SESSION['reserva'][$id_aula] = 't';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

else if(strcmp($reserva, 'cancelamento') == 0) {
  $vagas += 1;
  Vagas_Aulas_Atualizadas($vagas, $id_aula);
  deleteReservaAula($_SESSION['num_conta'], $id_aula);
  $_SESSION['reserva'][$id_aula] = 'f';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

else {
  return 0;
}

$title = "Descricao do Treinador x";
include("templates/menu.php");

include("templates/descricao_aula.php");

?>
