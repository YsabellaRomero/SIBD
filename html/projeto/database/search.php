<?php
  session_start();

  function getsearchmodalidade($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT Modalidade.nome , Modalidade.ID FROM Modalidade  WHERE nome LIKE ? ');
    $stmt->execute(array("%$search%"));
    return $stmt->fetch();
  }

  function getsearchtreinador($search) {
    global $dbh;
    $stmt = $dbh->prepare('SELECT Pessoa.name, Pessoa.NIF FROM Treinador JOIN Pessoa USING (NIF) WHERE name LIKE ? ');
    $stmt->execute(array("%$search%"));
    return $stmt->fetch();
  }

  function searchword($search) {
    $res1 = getsearchmodalidade($search);
    $res2 = getsearchtreinador($search);
    if($res1){
      $_SESSION["cat_mod"] = "modalidade";
      $_SESSION["info"] = $search;
      $_SESSION["info_comp"] = $res1['nome'];
      $_SESSION["info_comp_id"] = $res1['ID'];
      return;
    }
    else if($res2){
      $_SESSION["cat_trein"] = "treinador";
      $_SESSION["info"] = $search;
      $_SESSION["info_comp"] = $res2['name'];
      $_SESSION["info_comp_nif"] = $res2['NIF'];
      return;
    }
    else {
      $_SESSION["msg"] = "termo não encontrado";
      header('Location: templates/index.php');
    }
  }
 ?>
