<?php
    function getModalidadesByInstalacao($instalacao) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Modalidade JOIN Aula ON (Aula.id_modalidade = Modalidade.ID) JOIN Treino ON (Aula.ref_treino = Treino.ID) WHERE localizacao = (?) GROUP BY nome');
      $stmt->execute(array($instalacao));
      return $stmt->fetchAll();
    }

    function getDescricao($id_modalidade) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Ocorrencia JOIN Aula ON (Ocorrencia.ID_aula = Aula.ID) WHERE Ocorrencia.ID_modalidade = ?');
      $stmt->execute(array($id_modalidade));
      return $stmt->fetchAll();
    }
?>
