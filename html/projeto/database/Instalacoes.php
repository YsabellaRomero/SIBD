<?php

    function getAllInstalacoes($page) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Instalacao LIMIT ? OFFSET ?');
    $stmt->execute(array(1, ($page-1)*1));
      return $stmt->fetchAll();
    }

    function getInstalacoesById($id) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Instalacao WHERE id = ?');
      $stmt->execute(array($id));
      return $stmt->fetch();
    }

    function getNumberOfInstalacoes() {
      global $dbh;
      $stmt = $dbh->prepare('SELECT COUNT(*) AS count FROM Instalacao');
      $stmt->execute();
      return $stmt->fetch()['count'];
    }

?>
