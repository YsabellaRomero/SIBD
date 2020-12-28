<?php

  function Vagas_PT_Atualizadas($vagas, $id_treino) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Treino_Individual SET vaga = (?) WHERE ID = (?)');
    $stmt->execute(array($vagas, $id_treino));
  }

  function Vagas_Aulas_Atualizadas($vagas, $id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('UPDATE Ocorrencia SET vagas = (?) WHERE ID_aula = (?)');
    $stmt->execute(array($vagas, $id_aula));
  }

  function getOcorrencia($id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Ocorrencia WHERE ID_aula = (?)');
    $stmt->execute(array($id_aula));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function insertReservaAula($num_socio, $id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('INSERT INTO Reserva_Aula VALUES(?, ?)');
    $stmt->execute(array($num_socio, $id_aula));
  }

  function getReservaAula($num_socio, $id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Reserva_Aula WHERE num_conta = ? AND ID_aula = ?');
    $stmt->execute(array($num_socio, $id_aula));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function deleteReservaAula($num_socio, $id_aula) {
    global $dbh;
    $stmt = $dbh->prepare('DELETE FROM Reserva_Aula WHERE num_conta = ? AND ID_aula = ?');
    $stmt->execute(array($num_socio, $id_aula));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function insertReservaPT($num_socio, $id_pt) {
    global $dbh;
    $stmt = $dbh->prepare('INSERT INTO Reserva_Treino_Individual VALUES(?, ?)');
    $stmt->execute(array($num_socio, $id_pt));
  }

  function getReservaPT($num_socio, $id_pt) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Reserva_Treino_Individual WHERE num_conta = ? AND ID_PT = ?');
    $stmt->execute(array($num_socio, $id_pt));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function deleteReservaPT($num_socio, $id_pt) {
    global $dbh;
    $stmt = $dbh->prepare('DELETE FROM Reserva_Treino_Individual WHERE num_conta = ? AND ID_PT = ?');
    $stmt->execute(array($num_socio, $id_pt));
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

?>
