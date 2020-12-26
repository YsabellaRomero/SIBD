<section id="cart">
  <h2>Carrinho</h2>

  <table>
    <?php foreach ($Artigos as $Artigo) { ?>
      <?php var_dump($Artigo['Preço']) ?>
      <tr>
        <td><img src="/images/<?=$Artigo['Categoria']?>/<?=$Artigo['Num_serie']?>.jpg"></td>
        <td><?=$Artigo['Marca']?> <?=$Artigo['Modelo']?></td>
        <td><?=$Artigo['Preço']?>€</td>
        <td><?=$Artigo['quantity']?></td>
      </tr>
    <?php } ?>
  </table>

  <form action="action_checkout.php">
    <input type="submit" value="Checkout">
  </form>

</section>
