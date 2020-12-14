<div id="contactos">
  <h1>As nossas instalações</h1>
  <section class="list">
    <?php foreach ($contactos as $info) { ?>
      <article>
        <h3>Diretor: <?= $info['diretor']?></a></h3>
        <h3>Gerente: <?= $info['gerente']?></a></h3>
        <h3>Email: <?= $info['email']?></a></h3>
        <h3>Número de telemóvel: <?= $info['numero_telemovel']?></a></h3>
      </arcticle>
    <?php } ?>
  </section>
</div>

</body>
</html>
