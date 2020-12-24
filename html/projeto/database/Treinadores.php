<?php

  function getTreinadorByInstalacao($instalacao) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Treinador USING (NIF) JOIN Treino USING (id_gym) WHERE localizacao = ?');
    $stmt->execute(array($instalacao));
    return $stmt->fetchAll();
  }

?>
