<?php

  $title = "Lista de Instalações";
  include("menu.php");

  include('./database/Instalacoes.php');g
  $instalacoes = getAllInstalacoes();

?>
      <div id="instalacoes">
        <section class="list">
          <?php foreach($instalacoes as $row) { ?>
            <article>
              <h3><a href="../list_instalacoes.php"><?php $row["localizacao"]?></a></h3>
              <img src="imagens/<?=$row["localizacao"] ?>/lobbie.jpg">
            </arcticle>
          <?php } ?>
        </section>
    </div>

  </body>
</html>
