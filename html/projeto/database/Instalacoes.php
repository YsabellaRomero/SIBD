<?php

    function getAllInstalacoes() {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Instalacao');
      $stmt->execute();
      return $stmt->fetchAll();
    }

    function getInstalacoesById($instalacao) {
      global $dbh;
      $stmt = $dbh->prepare("SELECT * FROM Instalacao WHERE id = ?");
      $stmt->execute(array($instalacao));
      return $stmt->fetch();
    }

?>
