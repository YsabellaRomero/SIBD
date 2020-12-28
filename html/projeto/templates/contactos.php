    <div id="contactos">
      <h2><a href="list_instalacoes.php?">Instalações</a> &gt; <a><?= $localizacao['localizacao'] ?></a>  &gt; <a>Contactos</a></h2>
      <section class="list">
        <?php foreach ($contactos as $info) { ?>
          <article>
            <h3>Diretor: <?= $info['diretor']?></a></h3>
            <h3>Gerente: <?= $info['gerente']?></a></h3>
            <h3>Email: <?= $info['email']?></a></h3>
            <h3>Número de telemóvel: <?= $info['numero_telemovel']?></a></h3>
          </arcticle>
        <?php } ?>
        <div class="img_contacto">
          <img id="img_contacto1" src="imagens/<?= $localizacao['localizacao'] ?>/interior.jpg">
          <img id="img_contacto2" src="imagens/<?= $localizacao['localizacao'] ?>/piscina.jpg">
          <img id="img_contacto3" src="imagens/<?= $localizacao['localizacao'] ?>/sala_maquinas.jpg">
        </div>
      </section>
    </div>

  </body>
</html>
