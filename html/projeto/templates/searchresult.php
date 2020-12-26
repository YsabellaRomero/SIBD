<?php
  session_start();

  $trein = $_SESSION["cat_mod"];
  unset($_SESSION["cat_mod"]);

  $mod = $_SESSION["cat_trein"];
  unset($_SESSION["cat_trein"]);

  $info = $_SESSION["info"];
  unset($_SESSION["info"]);

  $info_comp = $_SESSION["info_comp"];
  unset($_SESSION["info_comp"]);
?>

    <header>
      <h1><a>Resultados Procura</a>
        <a>"<?php echo $info; ?>"</a>
        <a><?php echo $mod; ?></a>
        <a><?php echo $trein; ?></a>
        <a><?php echo $info_comp; ?></a>
        <a>para a sua localidade</a>

      </h1>
    </header>
<section>
  <?php
    //if(isset($_SESSION["cat_trein"])) {
    if($trein != NULL){
      foreach ($search_results as $search_result) { ?>
        <ul>
          <li>
            <a href="list_search.php?id=<?=$search_result['name']?>">
              <?=$search_result['name']?>
            </a>
          </li>
        </ul>
  <?php } }?>

  <?php
    //if(isset($_SESSION["cat_mod"])) {
    if($mod != NULL){
      foreach ($search_results as $search_result) { ?>
        <ul>
          <li>
            <a href="list_search.php?id=<?=$search_result['nome']?>">
              <?=$search_result['nome']?>
            </a>
          </li>
        </ul>
  <?php } }?>
</section>

  </body>
</html>
