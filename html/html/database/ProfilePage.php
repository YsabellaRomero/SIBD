<?php
  function getClientInfo($email) {
    global $dbh;

    $stmt = $dbh->prepare('SELECT Nome, NIF, Num_telefone FROM Conta WHERE Email = ?');
    $stmt->execute(array($email));

    return $stmt->fetch(PDO::FETCH_ASSOC);
  }
?>
