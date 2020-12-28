<section id="treinos" class="treinos_pt">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a href="list_opcoes_instalacoes.php?id=<?=$instalacao_info['id']?>"><?= $instalacao_info['localizacao'] ?></a> &gt; <a href="tipo_de_treinos.php?id=<?=$instalacao_info['id']?>">Treino Pessoal</a></h2>
  <section class="list">
    <h3>Treinadores:</h3>
    <ul>

        <?php
          $i = 0;
          $j = 0;
          foreach ($treinadores as $treinador) {
            $nifs[] = $treinador['NIF'];
            $nomes[] = $treinador['name'];
            $i = $i + 1;
            if( $i == 3 ) {
              break;
            }
          }

          foreach ($nomes as &$treinador) {
            $nif = $nifs[$j];
            if( strcmp($treinador, 'Francisco Monteiro') == 0 || strcmp($treinador, 'André Melim') == 0 || strcmp($treinador, 'David Maia') == 0 ) { ?>
              <li><h5><a href="horario_treinador1.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?= $treinador?></a></h5></li>
            <?php }
            else if( strcmp($treinador, 'Carolina Marques') == 0 || strcmp($treinador, 'Carlos Pinto') == 0 || strcmp($treinador, 'Sandra Moniz') == 0 ) { ?>
              <li><h5><a href="horario_treinador2.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?= $treinador?></a></h5></li>
            <?php }
            else { ?>
              <li><h5><a href="horario_treinador3.php?id=<?=$instalacao_info['id']?>&nif=<?=$nif?>"><?= $treinador?></a></h5></li>
          <?php }
          $j = $j + 1;
        } ?>

    </ul>
  </section>
</section>

</body>
</html>
