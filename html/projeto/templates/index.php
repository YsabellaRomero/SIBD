<?php
  session_start();
  /*$msg = $_SESSION["msg"];
  unset($_SESSION["msg"]);*/

  $title = "Página Inicial";
  include("menu.php");

?>
<header>
  <h1> M.Y. Space</h1>
</header>
<div class="info">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit justo eu scelerisque egestas. Ut sit amet consequat quam. Ut vitae convallis est. Curabitur gravida leo est, eu feugiat turpis mollis et. Sed massa odio, condimentum vitae augue vel, tempus auctor urna. Duis faucibus sodales augue, sit amet euismod justo ornare sit amet. Phasellus pharetra dictum massa in vehicula. Curabitur aliquam ex eu purus faucibus, eget suscipit odio semper.
    Sed sed nisl a purus dignissim auctor a eu eros. Quisque nec est non lectus iaculis vehicula. In fermentum varius sem, a mollis felis feugiat placerat. Cras cursus gravida efficitur. Etiam molestie vehicula nunc, non efficitur libero fringilla quis. Aenean sit amet est posuere, rutrum tortor sed, vulputate metus. Integer et velit eget elit pulvinar ullamcorper vel ut urna. Fusce condimentum quam velit, eu suscipit turpis mattis sed. Vivamus sit amet mollis lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam mattis nulla id augue bibendum feugiat. Proin blandit hendrerit tellus, ut condimentum magna tempus sit amet. In hac habitasse platea dictumst.
  </p>
  <span><?php /*echo $msg;*/ ?></span>
  <img id="img_index" src="../imagens/pexels-william-choquette-1954524.jpg" alt="gym">

</div>


</body>
</html>
