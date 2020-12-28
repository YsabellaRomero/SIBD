<?php

  require_once('config/init.php');
  require_once('database/Instalacoes.php');

  $n_intalacoes = getNumberOfInstalacoes();
  $n_pages = ceil($n_intalacoes / 1);

  if(isset($_GET['page'])) {
  $page = $_GET['page'];
  if($page < 1 ) {
    $page = 1;
  }
  if($page > $n_pages) {
    $page = $n_pages;
  }
  } else {
    $page = 1;
  }

  $instalacoes = getAllInstalacoes($page);

  $title = "Lista de Instalações";
  include("templates/menu.php");

  include("templates/list_instalacoes.php");

?>
