<?php
    function getModalidade($id_treino) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Modalidade JOIN Aula ON (Aula.id_modalidade = Modalidade.ID) JOIN Treino ON (Aula.ref_treino = Treino.ID) WHERE ref_treino = ?');
      $stmt->execute(array($id_treino));
      return $stmt->fetch();
    }

?>
