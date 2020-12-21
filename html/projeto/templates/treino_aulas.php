<sec id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?> &gt; <a>Treinos</a></h2>
  <section class="list">
      <ul>
        <li>

          <a href="list_pt.php?">Treino Pessoal</a>
          <a href="list_aulas.php?">Aulas</a>
          <section class="list_modalidades">
            <ul>
              <li>
                <?php foreach ($modalidades as $modalidade) { ?>
                  <h3><a href="modalidade_info.php?"><?= $modalidade['nome']?></a></h3>
                <?php } ?>
              </li>
            </ul>
          </section>
        </li>
      </ul>
  </section>
</div>
</body>
</html>
