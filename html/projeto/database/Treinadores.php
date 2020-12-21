<?php

    function getAllTreinadores() {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Treinador USING (NIF)');
      $stmt->execute();
      return $stmt->fetchAll();
    }

    function getAllInfo($NIF) {
      global $dbh;
      $stmt = $dbh->prepare('SELECT * FROM Pessoa WHERE NIF = ?');
      $stmt->execute(array($NIF));
      return $stmt->fetch();
    }

?>
