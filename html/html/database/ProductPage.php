<?php
  function getSepcsByProduct($category, $numserie) {
    global $dbh;

    switch($category) {

      case 'Monitor':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, Monitor WHERE Monitor.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'Rato':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, Rato WHERE Rato.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'Teclado':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, Teclado WHERE Teclado.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'Headphones':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, Headphones WHERE Headphones.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'PSU':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, PSU WHERE PSU.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'CPU':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, CPU WHERE CPU.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'GPU':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, GPU WHERE GPU.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'RAM ':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, RAM WHERE RAM.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;

      case 'Disco':
        $stmt = $dbh->prepare('SELECT * FROM Artigo, Disco WHERE Disco.Num_serie = Artigo.Num_serie AND Artigo.Num_serie = ?');
        break;
    }

    $stmt->execute(array($numserie));
    return $stmt->fetchAll();
  }
 ?>
