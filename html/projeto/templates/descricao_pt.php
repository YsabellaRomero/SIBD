<section id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?></a> &gt; <a> Treino Pessoal </a></h2>
  <section class="list">
    <h1><a> Treino Pessoal - <?=$pt[0]['hora_inicio']?></h1>

      <ul>
        <li>Treinador: <?= $treinador['name'] ?></li>
        <li>Duração: 1 hora</li>
        <br>
        <br>
        <li>  <?php if( $pt[0]['vaga'] > 0) { ?>
          <form action="reserva_vagas_pt.php?id=<?=$instalacao_info['id']?>" method="post">
            Livre -
            <input type='hidden' name='numero_de_vagas' value='<?php echo $pt[0]['vaga'] ?>' >
            <input type='hidden' name='id_treino' value='<?php echo $pt[0]['ID'] ?>' >
            <input type="submit" value="RESERVAR">
          </form>
        <?php }
        else { ?>
          Ocupado
        <?php } ?>
        </li>
      </ul>
</body>
</html>
