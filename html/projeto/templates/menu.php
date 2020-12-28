<?php
  session_start();
  $msg = $_SESSION["msg"];
  unset($_SESSION["msg"]);

?>

<!DOCTYPE html>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title><?php echo $title ?></title>
    <link href="/projeto/css/style.css" rel="stylesheet">
    <link href="/projeto/css/layout.css" rel="stylesheet">
  </head>
  <body>
    <nav id="menu">
      <header>
        <h1> <a href="/projeto/templates/index.php">M.Y. Space</a></h1>
      </header>
      <ul>
        <li><a href="/projeto/list_instalacoes.php">Instalações</a></li>
        <li><a href="/projeto/templates/about.php">Sobre nós</a></li>

        <?php if (isset($_SESSION["utilizador"])) {?>
          <li><a href="/projeto/logout_action.php">Log out</a></li>       <!-- existe login válido -->
          <span> <?php echo $_SESSION["utilizador"]; ?></span>
        <?php } ?>

      </ul>

      <?php if (!isset($_SESSION["utilizador"])){ ?>
      <aside id="login">
        <form action="/projeto/login_action.php" method="post">
          <label for="email">Login</label>
          <input type="text" id="user" name="email" placeholder="email">
          <label for="pwd"></label>
          <input type="password" id="pwd" name="password" placeholder="password">
          <input type="submit" value="Log in">
        </form>
      </aside>
      <ul id="create_acc">
        <li><a href="/projeto/templates/register.php">Criar Conta</a></li>
      </ul>
    <?php }?>
    <span><?php echo $msg; ?></span>

    <form id="search" action="/projeto/list_search.php">
      <input type="text" name="search" placeholder="">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>

    </nav>
