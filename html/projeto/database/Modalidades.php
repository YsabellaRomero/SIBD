<?php

  function getModalidade($id_modalidade) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Modalidade JOIN Aula ON (Aula.id_modalidade = Modalidade.ID) WHERE id_modalidade = ?');
    $stmt->execute(array($id_modalidade));
    return $stmt->fetchAll();
  }

?>
