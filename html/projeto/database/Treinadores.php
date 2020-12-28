<?php

  function getTreinadorByInstalacao($instalacao) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Treinador USING (NIF) JOIN Treino USING (id_gym) WHERE localizacao = ?');
    $stmt->execute(array($instalacao));
    return $stmt->fetchAll();
  }

  function getAllInfo($NIF) {
     global $dbh;
     $stmt = $dbh->prepare('SELECT * FROM Pessoa WHERE NIF = ?');
     $stmt->execute(array($NIF));
     return $stmt->fetch();
   }

  function getTreinador_Aula_ByOcorrencia($id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Pessoa JOIN Treinador USING (NIF) JOIN Treino USING (id_gym) JOIN Aula ON (Aula.ref_treino = Treino.ID) JOIN Modalidade ON (Aula.id_modalidade = Modalidade.ID) JOIN Ocorrencia ON (Ocorrencia.ID_modalidade = Modalidade.ID) WHERE Ocorrencia.ID_aula = (?)');
    $stmt->execute(array($id_aula));
    return $stmt->fetch();
  }
  
?>
