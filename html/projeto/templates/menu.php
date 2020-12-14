<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title><?php echo $title ?></title>
    <link href="/projeto/css/style.css" rel="stylesheet">
    <link href="/projeto/css/layout.css" rel="stylesheet">
  </head>
  <body>
    <nav id="menu">
      <ul>
        <li><a href="index.php">Página Inicial</a></li>
        <li><a href="../list_instalacoes.php">Instalações</a></li>
        <li><a href="about.php">Sobre nós</a></li>

        <?php if (!isset($_SESSION["utilizador"])){ ?>
          <li><a href="login.php">Log in</a></li>
          <li><a href="register.php">Create Account</a></li>
        <?php } else {?>
          <li><a href="../logout_action.php">Log out</a></li>       <!-- existe login válido -->
          <span> <?php echo $_SESSION["utilizador"]; ?></span>
        <?php } ?>

      </ul>
    </nav>
