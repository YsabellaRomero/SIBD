
      <?php
        session_start();
        /*$msg = $_SESSION["msg"];
        unset($_SESSION["msg"]);*/
      ?>

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
              <span><?php /*echo $msg;*/ ?></span>
      </div>

      <div id="pagination">
        <a href="?page=<?php echo $page-1; ?>">&lt;</a>
        <?php echo $page; ?>
        <a href="?page=<?php echo $page+1; ?>">&gt;</a>
      </div>

  </body>
</html>
