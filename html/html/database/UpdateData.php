<?php
  function UpdateData($data, $param, $email) {
    global $dbh;

    switch($data) {
      case 'Nome':
        $stmt = $dbh->prepare('UPDATE Conta SET Nome = ? WHERE Email = ?');
        break;

      case 'NIF':
        $stmt = $dbh->prepare('UPDATE Conta SET NIF = ? WHERE Email = ?');
        break;

      case 'Num_telefone':
        $stmt = $dbh->prepare('UPDATE Conta SET Num_telefone = ? WHERE Email = ?');
        break;

      case 'Password':
        $stmt = $dbh->prepare('UPDATE Conta SET Password = ? WHERE Email = ?');
        break;
    }

    $stmt->execute(array($param, $email));
  }

  function CheckPassword($email) {
    global $dbh;

    $stmt = $dbh->prepare('SELECT Password FROM Conta WHERE Email = ?');
    $stmt->execute(array($email));

    return $stmt->fetch(PDO::FETCH_ASSOC);
  }
 ?>
