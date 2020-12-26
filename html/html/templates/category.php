  <section id="Category">
    <body>
      <section class="list">
        <?php foreach($products as $Artigo) { ?>
          <article>
            <a href="product_page.php?numserie=<?=$Artigo['Num_serie']?>&category=<?=$Artigo['Categoria']?>">
              <h3><?=$Artigo['Marca']?> <?=$Artigo['Modelo']?></h2>
              <img src="./images/<?=$Artigo['Categoria']?>/<?=$Artigo['Modelo']?>.jpg">
            </a>
            <p class="price">€<?=number_format($Artigo['Preço'], 2)?></p>
            <form action="action_add_to_cart.php" method="post">
              <input type="hidden" name="Num_serie" value="<?=$Artigo['Num_serie']?>">
              <button>Adicionar ao carrinho</button>
            </form>
          </article>
        <?php } ?>
      </section>
    </body>
  </section>
</html>
