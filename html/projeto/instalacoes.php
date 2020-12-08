<?php

  $dbh = new PDO('sqlite:sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_BOTH);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  try {
    $stmt = $dbh->prepare('SELECT * FROM Instalacao');
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
    <title>Instalações</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <link href="layout.css" rel="stylesheet">
  </head>
  <body>

    <header>
      <h1>As nossas instalações</h1>
    </header>
      <section id="instalacoes">
      <?php foreach($result as $row) { $lala = $row["localizacao"] ?>
        <li>
          <a href="<?php echo $lala; ?>.php"><?php echo $lala ?></a>
          <br>
          <img src="imagens/<?php echo $lala; ?>/lobbie.jpg">
        </li>
      <?php } ?>
    </section>

    <?php include("menu.php"); ?>

  </body>
</html>
