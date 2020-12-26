<?php
  function getProductsByCategory($category) {
    global $dbh;

    $stmt = $dbh->prepare('SELECT * FROM Artigo WHERE Categoria = ?');
    $stmt->execute(array($category));

    return $stmt->fetchAll();
  }

  function getProductByNumSerie($numserie) {
    global $dbh;
    
    $stmt = $dbh->prepare('SELECT * FROM Artigo WHERE Num_serie = ?');
    $stmt->execute(array($numserie));

    return $stmt->fetchAll();
  }
 ?>
