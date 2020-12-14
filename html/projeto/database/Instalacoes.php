<?php

    function getAllInstalacoes() {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Instalacao');
      $stmt->execute();
      return $stmt->fetchAll();
    }

    function getInstalacoesById($id) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Instalacao WHERE id = ?');
      $stmt->execute(array($id));
      return $stmt->fetch();
    }

?>
