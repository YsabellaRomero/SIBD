<?php

function loginValido($email,$password){
  global $dbh;
  //$stmt = $dbh->prepare('SELECT name FROM Pessoa JOIN Socio USING (NIF) WHERE email = (?) AND password = (?)');

  $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Socio USING (NIF) JOIN Instalacao on instalacao=Instalacao.id WHERE email = (?) AND password = (?)');
  $stmt->execute(array($email, sha1($password)));
  return $stmt->fetch();          //devolve a coluna ou false
}

 ?>
