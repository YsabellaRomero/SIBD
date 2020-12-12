<?php
  $instalacao = $_GET['id'];

  $dbh = new PDO('sqlite:sql/ginasio.db');
  $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  try {

    $stmt = $dbh->prepare("SELECT localizacao FROM Instalacao");
    $stmt->execute();
    $name = $stmt->fetchAll();

    $stmt = $dbh->prepare("SELECT * FROM Contacto WHERE instalacao=?");
    $stmt->execute(array($instalacao));
    $result= $stmt->fetchAll();

  } catch(PDOException $e) {
    echo $e->getMessage();
    exit(0);
    }

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Contactos de cada instalação</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/layout.css" rel="stylesheet">
  </head>
  <body>
    <?php include("menu.php"); ?>

    <div id="contactos">
        <h2><a href="instalacoes.php">Instalações</a> &gt; <a href="<?php echo $name["localizacao"] ?>.php"> <?php echo $name["localizacao"] ?> </a> &gt; Contactos</h2>
      <?php foreach($result as $row) { ?>
      <section class="list">

            <article>
              <h3><?php echo $row1["gerente"] ?></h3>
            </article>

        <?php } ?>
      </section>
    </div>
  </body>
</html>
