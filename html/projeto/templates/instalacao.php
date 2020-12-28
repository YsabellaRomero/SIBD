
    <div id="instalacao_opcoes">
    <h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?></a></h2>
      <section class="list">
          <ul>
            <li><a href="list_contactos.php?id=<?=$instalacao_info['id']?>">Contactos</a></li>

                <li>
                  <a href="tipo_de_treinos.php?id=<?=$instalacao_info['id']?>">Treinos</a>
                </li>
          </ul>
      </section>
    </div>
  </body>
</html>
