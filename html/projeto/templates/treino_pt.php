<section id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?></a> &gt; <a>Treino Pessoal</a></h2>
  <section class="list_treinadores">
    <h3>Treinadores:</h3>
    <ul>
      <li>
        <?php
          $i = 0;
          foreach ($treinadores as $treinador) {
            $variable[] = $treinador['name'];
            $i = $i + 1;
            if( $i == 3 ) {
              break;
            }
          }

          foreach ($variable as &$treinador) { ?>
              <h5><a href="horario_treinador.php?id=<?=$instalacao_info['id']?>"><?= $treinador?></a></h5>
          <?php } ?>
      </li>
    </ul>
  </section>
</section>

</body>
</html>
