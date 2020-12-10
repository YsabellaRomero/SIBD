<?php

  $dbh = new PDO('sqlite:sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_BOTH);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  try {
    $stmt = $dbh->prepare('SELECT * FROM Contacto');
    $stmt->execute();
    $result = $stmt->fetchAll();
  } catch(PDOException $e) {
    echo $e->getMessage();
    exit(0);
    }

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Boavista info</title>
  </head>
  <body>
    <?php include("menu.php"); ?>

    <div class="instalacoes_info">
        <h2>
          <ul>
            <li class="dropdown">
              <a href="instalacoes.php" class="dropbtn">Instalações &gt; </a>
              <div class="dropdown-content">
                <a href="Boavista.php">Boavista</a>
                <a href="Matosinhos.php">Matosinhos</a>
                <a href="Braga.php">Braga</a>
              </div>
            </li>
            <li><a href="#">Boavista</a></li>
          </ul>
        </h2>
        <ul>
          <li><a href="contactos_boavista.php">Contactos</a></li>
          <li><a href="horarios_boavista.php">Horarios</a></li>
      </div>
  </body>
</html>
