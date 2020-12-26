<?php
  if(!isset($_SESSION)) {
    session_start();
  }
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title><?php echo $title; ?></title>
    <link rel="stylesheet" href="/css/headerstyle.css">
    <link rel="stylesheet" href="/css/categorypage.css">
  </head>
  <body>
    <div class="navbar">
      <div class="dropdown">
        <button class="dropbtn">Categorias</button>
        <div class="dropdown-content">
          <a href="/list_products.php?category=Monitor">Monitores</a>
          <a href="/list_products.php?category=Rato">Ratos</a>
          <a href="/list_products.php?category=Teclado">Teclados</a>
          <a href="/list_products.php?category=Headphones">Headphones</a>
          <a href="/list_products.php?category=Processador">Processadores</a>
          <a href="/list_products.php?category=Placa gráfica">Placas gráficas</a>
          <a href="/list_products.php?category=RAM">Memórias RAM</a>
          <a href="/list_products.php?category=PSU">Fontes de alimentação</a>
          <a href="/list_products.php?category=Disco">Discos de armazenamento</a>
        </div>
      </div>
      <div class="rightNav">
        <<?php
          if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
        ?>
          <a href="/action_logout.php">Terminar sessão</a>
          <a href="/action_profile.php">Perfil</a>
          <a href="list_cart.php">Carrinho</a>
        <?php
          }
          else {
        ?>
          <a href="/templates/login.php">Iniciar sessão</a>
          <a href="/templates/register.php">Registar</a>
        <?php
          }
        ?>
      </div>
    </div>
