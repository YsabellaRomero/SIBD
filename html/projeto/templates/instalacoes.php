<?php

  $title = "Lista de Instalações";
  include("menu.php");
?>

    <header>
      <h1>As nossas instalações</h1>
    </header>
      <div id="instalacoes">
        <section class="list">
          <?php foreach($instalacoes as $row) { ?>
            <article>
              <h3><a href="../list_instalacoes.php?id=<?php $instalacao['id']?>"><?php $row["localizacao"]?></a></h3>
              <img src="imagens/<?=$row["localizacao"] ?>/lobbie.jpg">
            </arcticle>
          <?php } ?>
        </section>
    </div>

  </body>
</html>
