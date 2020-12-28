<?php
  session_start();

  $mod = $_SESSION["cat_mod"];
  unset($_SESSION["cat_mod"]);

  $trein = $_SESSION["cat_trein"];
  unset($_SESSION["cat_trein"]);

  $info = $_SESSION["info"];
  unset($_SESSION["info"]);

  $info_comp = $_SESSION["info_comp"];
  unset($_SESSION["info_comp"]);

  $instalacao_info['localizacao']=$_SESSION['local_id'];
  $instalacao_info['id'] = $_SESSION['local_id'];
  //unset($_SESSION["local_id"]);

  $id = $_SESSION["info_comp_id"];
  unset($_SESSION["info_comp_id"]);

  $nif = $_SESSION["info_comp_nif"];
  unset($_SESSION["info_comp_id"]);
?>

    <header>
      <h1><a>Resultados Procura</a>
        <a>"<?php echo $info; ?>"</a>
        <a> - </a>
        <a><?php echo $mod; ?></a>
        <a><?php echo $trein; ?></a>
      </h1>
    </header>
<section>
  <?php
    if($trein != NULL) { ?>
        <ul>
          <li>
            <?php if( strcmp($trein,'Francisco Monteiro') == 0 || strcmp($treinador, 'André Melim') == 0 || strcmp($treinador, 'David Maia') == 0 ) { ?>
              <a href="horario_treinador1.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$info_comp?></a>
            <?php }
            else if( strcmp($treinador, 'Carolina Marques') == 0 || strcmp($treinador, 'Carlos Pinto') == 0 || strcmp($treinador, 'Sandra Moniz') == 0 ) { ?>
              <a href="horario_treinador2.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$info_comp?></a>
            <?php }
            else { ?>
              <a href="horario_treinador3.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?=$info_comp?></a>
            <?php } ?>
          </li>
        </ul>
  <?php }?>

  <?php
    if($mod != NULL){ ?>
        <ul>
          <li>
            <a href="horario_<?php echo $info_comp?>.php?id=<?=$instalacao_info['id']?>&id_modalidade=<?=$id?>">
              <?=$info_comp?>
            </a>
          </li>
        </ul>
  <?php } ?>
</section>

  </body>
</html>
