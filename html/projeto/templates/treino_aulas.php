<sec id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?> &gt; <a>Treinos</a></h2>
  <section class="list">
      <ul>
        <li>
          <h3><a href="horario_completo.php?id=<?=$instalacao_info['id']?>">Horário Completo</a></h3>
        </li>
        <li>
          <?php
            $i = 0;
            $j = 0;
            foreach ($modalidades as $modalidade) {
              $aulas[] = $modalidade['nome'];
              $ids[] = $modalidade['ID'];
              $i = $i + 1;
              if( $i == 4 ) {
                break;
              }
            }
            foreach ($aulas as &$modalidade) {
              $id = $ids[$j]; ?>
              <h3><a href="horario_<?php echo $modalidade?>.php?id=<?=$instalacao_info['id']?>&id_modalidade=<?=$id?>"><?= $modalidade?></a></h3>
            <?php $j = $j + 1;
          } ?>
          </li>
        </ul>
      </section>
    </body>
</html>
