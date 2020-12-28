  <section id="treinos" class="descricao">

  <?php session_start(); ?>
  <h2><a href="list_instalacoes.php">Instalações</a> &gt; <a href="list_opcoes_instalacoes.php?id=<?=$instalacao_info['id']?>"><?= $instalacao_info['localizacao'] ?></a> &gt; <a href="horario_<?= $modalidade['nome'] ?>.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>"><?= $modalidade['nome'] ?></a></h2>
    <section class="list">
      <h1><a> <?= $modalidade['nome']?> - <?=$descricao[0]['hora_inicio']?></h1>

        <ul>
          <li>Treinador: <?= $treinador['name'] ?></li>
          <li>Espaço: <?= $descricao[0]['espaco'] ?></li>
          <li>Duração: 1 hora</li>
          <li>Vagas - <?= $descricao[0]['vagas'] ?></li>
          <br>
          <br>
          <li>  <?php if( $descricao[0]['vagas'] > 0 && (strcmp($_SESSION['reserva'][$id_aula],'f') == 0)) { ?>
            <form action="reserva_vagas_aulas.php?id=<?=$instalacao_info['id']?>" method="post">
              <input type='hidden' name='numero_de_vagas' value='<?php echo $descricao[0]['vagas'] ?>' >
              <input type='hidden' name='id_aula' value='<?php echo $descricao[0]['ID_aula'] ?>' >
              <input type='hidden' name='reserva' value='reserva' >
              <input type="submit" value="RESERVAR">
            </form>
          <?php }
          else if($descricao[0]['vagas'] == 0 && (strcmp($_SESSION['reserva'][$id_aula],'t') != 0)) { ?>
            Sem vagas!
        <?php  }
         else if(isset($_SESSION['reserva']) && (strcmp($_SESSION['reserva'][$id_aula],'t') == 0)){ ?>
            Reservado!
            <form action="reserva_vagas_aulas.php?id=<?=$instalacao_info['id']?>" method="post">
              <input type='hidden' name='numero_de_vagas' value='<?php echo $descricao[0]['vagas'] ?>' >
              <input type='hidden' name='id_aula' value='<?php echo $descricao[0]['ID_aula'] ?>' >
              <input type='hidden' name='reserva' value='cancelamento' >
              <input type="submit" value="CANCELAR">
            </form>
        <?php } ?>
          </ul>
  </body>
</html>
