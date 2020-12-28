<?php
  session_start();

  function getsearchmodalidade($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT Modalidade.nome, Treino.ID FROM Modalidade JOIN Aula ON Modalidade.ID=id_modalidade JOIN Treino ON ref_treino=Treino.ID JOIN Instalacao ON Treino.localizacao=Instalacao.id WHERE Instalacao.localizacao=? AND Modalidade.nome LIKE ? ');
    $stmt->execute(array($_SESSION['local'], "%$search%"));
    return $stmt->fetch();
  }

  function getsearchtreinador($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT Pessoa.name, Pessoa.NIF FROM Treinador JOIN Pessoa USING (NIF) JOIN Treino USING (id_gym) JOIN Instalacao ON Treino.localizacao=Instalacao.id WHERE Instalacao.localizacao=? AND name LIKE ? ');
    $stmt->execute(array($_SESSION['local'],"%$search%"));
    return $stmt->fetch();
  }

  function searchword($search) {
    $res1 = getsearchmodalidade($search);
    $res2 = getsearchtreinador($search);
    if($res1){
      $_SESSION["cat_mod"] = "modalidade";
      $_SESSION["termo_procurado"] = $search;
      $_SESSION["termo_completo"] = $res1['nome'];
      $_SESSION["id_treino"] = $res1['ID'];
      return;
    }
    else if($res2){
      $_SESSION["cat_trein"] = "treinador";
      $_SESSION["termo_procurado"] = $search;
      $_SESSION["termo_completo"] = $res2['name'];
      $_SESSION["nif_treinador"] = $res2['NIF'];
      return;
    }
    else {
      $_SESSION["msg"] = "termo não encontrado";
      header('Location: templates/index.php');
    }
  }
 ?>
