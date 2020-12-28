<?php

  function Vagas_PT_Atualizadas($vagas, $id_treino) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Treino_Individual SET vaga = (?) WHERE ID = (?)');
    $stmt->execute(array($vagas, $id_treino));
    return $stmt->fetchAll();
  }

  function Vagas_Aulas_Atualizadas($vagas, $id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Ocorrencia SET vagas = (?) WHERE ID_aula = (?)');
    $stmt->execute(array($vagas, $id_aula));
    return $stmt->fetchAll();
  }

  function getOcorrencia($id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Ocorrencia WHERE ID_aula = (?)');
    $stmt->execute(array($id_aula));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

?>
