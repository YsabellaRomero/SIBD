<sec id="treinos" class="treinos_aulas">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?> &gt; <a>Treinos</a></h2>
  <section class="list">
      <ul>
        <li>
          <h3><a href="horario_completo.php?id=<?=$instalacao_info['id']?>">Horário Completo</a></h3>
        </li>
        <li>
          <?php
            foreach ($modalidades as $modalidade) { ?>
              <h3 class="list_mod"><a href="horario_<?php echo $modalidade['nome']?>.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>"><?= $modalidade['nome']?></a></h3>
          <?php } ?>
          </li>
        </ul>
      </section>
    </body>
</html>
