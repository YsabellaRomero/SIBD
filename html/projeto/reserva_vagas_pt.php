<?php

require_once('config/init.php');
require_once('database/Vagas.php');
session_start();

if(!isset($_SESSION)) {
  session_start();
}

//lugar a ser reservado
$vagas = $_POST['numero_de_vagas'];
$id_treino = $_POST['id_treino'];


if( $vagas > 0 ) {
  $vagas -= 1;
  Vagas_PT_Atualizadas($vagas, $id_treino);
  //redirecionamento aonde o utilizador estava
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

else {
  header('Location: ' . $_SERVER['HTTP_REFERER']);
}

$title = "Descricao do Treinador x";
include("templates/menu.php");

include("templates/descricao_pt.php");

?>
