<?php
  session_start();

  function getsearchmodalidade($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Modalidade  WHERE nome LIKE ? ');
    $stmt->execute(array("%$search%"));
    return $stmt->fetch();
  }

  function getsearchtreinador($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT * FROM Treinador JOIN Pessoa USING (NIF) WHERE name LIKE ? ');
    $stmt->execute(array("%$search%"));
    return $stmt->fetch();
  }

  function searchmodalidades($search){
    global $dbh;
    $stmt = $dbh->prepare('SELECT Modalidade.nome FROM Pessoa JOIN Treinador USING (NIF) JOIN Treino USING (id_gym) JOIN Instalacao ON Instalacao.id=Treino.localizacao JOIN Aula ON ref_treino=Treino.ID JOIN Modalidade ON id_modalidade=Modalidade.ID WHERE Pessoa.name LIKE ? AND Instalacao.localizacao=? GROUP BY Modalidade.nome');
    $stmt->execute(array("%$search%", $_SESSION['local']));
    return $stmt->fetchall();
  }

  function searchtreinador($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT Pessoa.name FROM Pessoa JOIN Treinador USING (NIF) JOIN Treino USING (id_gym) JOIN Instalacao ON Instalacao.id=Treino.localizacao JOIN Aula On ref_treino=Treino.ID Join Modalidade ON id_modalidade=modalidade.ID WHERE Modalidade.nome LIKE ? AND Instalacao.localizacao=? GROUP BY Pessoa.name');
    $stmt->execute(array("%$search%", $_SESSION['local']));
    return $stmt->fetchall();
  }

  function searchword($search) {
    if(getsearchmodalidade($search)){
      $_SESSION["cat_mod"] = "modalidade";
      $_SESSION["info"] = $search;
      return searchtreinador($search);
    }
    else if(getsearchtreinador($search)){
      $_SESSION["cat_trein"] = "treinador";
      $_SESSION["info"] = $search;
      return searchmodalidades($search);
    }
    else {
      $_SESSION["msg"] = "termo não encontrado";
      header('Location: templates/index.php');
    }
  }
 ?>
