<?php
  session_start();

  if(!isset($_SESSION["utilizador"])){
    $_SESSION["msg"] = "Por favor faça login!";
    header('Location: templates/login.php');
  }
  require_once('config/init.php');
  require_once('database/Instalacoes.php');

  $id = $_GET['id'];
  $instalacao_info = getInstalacoesById($id);

  $title = "Tipo de Treinos da Instalação x";
  include('templates/menu.php');

  include('templates/treinos.php');

?>
