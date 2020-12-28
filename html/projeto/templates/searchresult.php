<?php
  session_start();

  $mod = $_SESSION["cat_mod"];
  unset($_SESSION["cat_mod"]);

  $trein = $_SESSION["cat_trein"];
  unset($_SESSION["cat_trein"]);

  $termo = $_SESSION["termo_procurado"];
  unset($_SESSION["termo_procurado"]);

  $termo_completo = $_SESSION["termo_completo"];
  unset($_SESSION["termo_completo"]);

  //$instalacao_info['localizacao']=$_SESSION['local_id'];
  $instalacao_info['id'] = $_SESSION['local_id'];
  //unset($_SESSION["local_id"]);

  $id = $_SESSION["id_treino"];
  unset($_SESSION["id_treino"]);

  $nif = $_SESSION["nif_treinador"];
  unset($_SESSION["nif_treinador"]);
?>
  <?php if(isset($_SESSION["utilizador"])) {?>
    <header>
      <h1><a>Resultados Procura</a>
        <a>"<?php echo $termo; ?>"</a>
        <a> - </a>
        <a><?php echo $mod; ?></a>
        <a><?php echo $trein; ?></a>
      </h1>
    </header>
<section id="search_res">
  <?php
    if($trein != NULL) { ?>
        <ul>
          <li>
            <?php if( strcmp($trein,'Francisco Monteiro') == 0 || strcmp($treinador, 'André Melim') == 0 || strcmp($treinador, 'David Maia') == 0 ) { ?>
              <a href="horario_treinador1.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$termo_completo?></a>
            <?php }
            else if( strcmp($treinador, 'Carolina Marques') == 0 || strcmp($treinador, 'Carlos Pinto') == 0 || strcmp($treinador, 'Sandra Moniz') == 0 ) { ?>
              <a href="horario_treinador2.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$termo_completo?></a>
            <?php }
            else { ?>
              <a href="horario_treinador3.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$termo_completo?></a>
            <?php } ?>
          </li>
        </ul>
  <?php }?>

  <?php
    if($mod != NULL){ ?>
        <ul>
          <li>
            <a href="horario_<?php echo $termo_completo?>.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$id?>">
              <?=$termo_completo?>
            </a>
          </li>
        </ul>
  <?php } } else { ?>
    <header>
      <h1><a>Resultados Procura</a></h1>
    </header>
      <p>Por favor faça login para fazer pesquisa!</p>
    <?php } ?>
</section>

  </body>
</html>
