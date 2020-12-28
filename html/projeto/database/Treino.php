<?php

  function getTreino_IndividualByTreino($id_treino) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Treino_Individual WHERE ref_treino = ?');
    $stmt->execute(array($id_treino));
    return $stmt->fetchAll();
  }

?>
