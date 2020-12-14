
      <div id="instalacoes">
        <h1>As nossas instalações</h1>
        <section class="list">
          <?php foreach ($instalacoes as $instalacao) { ?>
            <article>
              <h3><a href="list_opcoes_instalacoes.php?id=<?=$instalacao['id']?>"><?= $instalacao['localizacao']?></a></h3>
              <img src="imagens/<?= $instalacao['localizacao'] ?>/lobbie.jpg">
            </arcticle>
          <?php } ?>
        </section>
      </div>

  </body>
</html>
