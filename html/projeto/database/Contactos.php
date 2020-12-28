<?php

  function getContactosByInstalacao($id) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Contacto WHERE instalacao = ?');
    $stmt->execute(array($id));
    return $stmt->fetchAll();
  }

?>
