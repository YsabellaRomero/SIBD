<section id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a href="list_opcoes_instalacoes.php?id=<?=$instalacao_info['id']?>"><?= $instalacao_info['localizacao'] ?></a> &gt; <a href="horario_treinador<?= $th ?>.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>&nif=<?=$treinador['NIF']?>">Treino Pessoal </a></h2>
  <section class="list">
    <h1><a> Treino Pessoal - <?=$pt[0]['hora_inicio']?></h1>

      <ul>
        <li>Treinador: <?= $treinador['name'] ?></li>
        <li>Duração: 1 hora</li>
        <br>
        <br>
        <li>  <?php if( $pt[0]['vaga'] > 0 && (strcmp($_SESSION['reserva'][$pt[0]['ID']],'f') == 0)) { ?>
          <form action="reserva_vagas_pt.php?id=<?=$instalacao_info['id']?>" method="post">
            Livre -
            <input type='hidden' name='numero_de_vagas' value='<?php echo $pt[0]['vaga'] ?>' >
            <input type='hidden' name='id_treino' value='<?php echo $pt[0]['ID'] ?>' >
            <input type='hidden' name='reserva' value='reserva' >
            <input type="submit" value="RESERVAR">
          </form>
        <?php }
        else if($pt[0]['vaga'] == 0 && (strcmp($_SESSION['reserva'][$pt[0]['ID']],'t') != 0)) { ?>
          Ocupado
        <?php }
        else if((isset($_SESSION['reserva']) && (strcmp($_SESSION['reserva'][$pt[0]['ID']],'t') == 0))) { ?>
          <form action="reserva_vagas_pt.php?id=<?=$instalacao_info['id']?>" method="post">
            Reservado -
            <input type='hidden' name='numero_de_vagas' value='<?php echo $pt[0]['vaga'] ?>' >
            <input type='hidden' name='id_treino' value='<?php echo $pt[0]['ID'] ?>' >
            <input type='hidden' name='reserva' value='cancelamento' >
            <input type="submit" value="CANCELAR">
          </form>
      <?php } ?>
        </li>
      </ul>
</body>
</html>
