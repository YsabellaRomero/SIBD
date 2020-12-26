<?php
    function getModalidadesByInstalacao($instalacao) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Modalidade JOIN Aula ON (Aula.id_modalidade = Modalidade.ID) JOIN Treino ON (Aula.ref_treino = Treino.ID) WHERE localizacao = ?');
      $stmt->execute(array($instalacao));
      return $stmt->fetchAll();
    }

?>
