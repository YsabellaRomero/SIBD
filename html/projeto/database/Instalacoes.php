<?php

  require_once('./config/init.php');

  try {
    function getAllInstacoes() {
      global $dbh;
      $stmt = $dbh->prepare("SELECT * FROM Instalacao");
      $stmt->execute();
      return $stmt->fetchAll();
    }

  } catch(PDOException $e) {
    echo $e->getMessage();
    exit(0);
    }

  try {
    function getInstalacoesById($id) {
      global $dbh;
      $stmt = $dbh->prepare("SELECT * FROM Instalacoes WHERE id = ?");
      $stmt->execute(array($id));
      return $stmt->fetch();
    }

  } catch(PDOException $e) {
    echo $e->getMessage();
    exit(0);
    }
?>
