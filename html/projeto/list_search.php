<?php

  session_start();

  require_once('config/init.php');
  require_once('database/search.php');

  if(!isset($_SESSION["utilizador"])){
    $_SESSION["msg"] = "Por favor faça login!";
    header('Location: templates/login.php');
  }

  $search = $_GET['search'];

  $search_results = searchword($search);

  include("templates/menu.php");
  include("templates/searchresult.php");

 ?>
