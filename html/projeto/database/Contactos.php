<?php

  function getContactosByInstalacao($instalacao) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Contacto WHERE instalacao = ?');
    $stmt->execute(array($instalacao));
    return $stmt->fetchAll();
  }

  function getInstalacoesById($instalacao) {
    global $dbh;
    $stmt = $dbh->prepare("SELECT * FROM Instalacao WHERE id = ?");
    $stmt->execute(array($instalacao));
    return $stmt->fetch();
  }

?>
