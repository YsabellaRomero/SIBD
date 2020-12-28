<?php
#verificar se valores introduzidos são válidos

function valoresValidos($mem_num,$email){
  global $dbh;
  $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Socio USING (NIF) WHERE numero_conta = (?) AND email = (?)');
  $stmt->execute(array($mem_num, $email));
  return $stmt->fetch();
}

#inserir password nova

function inserirtPass($password,$mem_num) {
  global $dbh;
  $stmt = $dbh->prepare('UPDATE Socio set password  = (?) where numero_conta = (?)');
  $stmt->execute(array(sha1($password), $mem_num));
}
 ?>
