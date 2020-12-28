  <section id="treinos">

  <?php session_start(); ?>
  <h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?></a> &gt; <a> <?= $modalidade['nome']?></a></h2>
    <section class="list">
      <h1><a> <?= $modalidade['nome']?> - <?=$descricao[0]['hora_inicio']?></h1>

        <ul>
          <li>Treinador: <?= $treinador['name'] ?></li>
          <li>Espaço: <?= $descricao[0]['espaco'] ?></li>
          <li>Duração: 1 hora</li>
          <li>Vagas - <?= $_SESSION['vagas_aula']['vagas'] ?></li>
          <br>
          <br>
          <li>  <?php if( $descricao[0]['vagas'] > 0 && $_SESSION['reserva'][$id_aula] != 't') { ?>
            <form action="reserva_vagas_aulas.php?id=<?=$instalacao_info['id']?>" method="post">
              <input type='hidden' name='numero_de_vagas' value='<?php echo $descricao[0]['vagas'] ?>' >
              <input type='hidden' name='id_aula' value='<?php echo $descricao[0]['ID_aula'] ?>' >
              <input type="submit" value="RESERVAR">
            </form>
          <?php }
          if($descricao[0]['vagas'] == 0) { ?>
            Sem vagas!
        <?php  }
          if(isset($_SESSION['reserva']) && $_SESSION['reserva'][$id_aula] == 't'){ ?>
            Reservado!
            <!-- meter o botao para cancelar aqui
            e nesse php vais dar update pra reintroduzir a vaga e metes isto == f e ta resolvido -->
          </ul>
  </body>
</html>
