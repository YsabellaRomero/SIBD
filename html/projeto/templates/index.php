<?php
  session_start();
  $msg = $_SESSION["msg"];
  unset($_SESSION["msg"]);

  $title = "Página Inicial";
  include("menu.php");

?>
<header>
  <h1> M.Y. Space</h1>
</header>
<div class="info">
  <p>Bem vindo(a) ao site do espaço M.Y. Space! Aqui poderá ver os contactos e informações sobre todas as instalações e mais importante, ter acesso aos horários das mesmas. </p>
  <p>Para poder ter acesso aos horários terá de ser sócio do nosso clube, para mais informações contacte através dos dados fornecidos na secção "Contactos", após ter escolhido a instalação de seu interesse.</p>
  <p>Não se esqueça também que pode reservar mais que uma sessão de treino pessoal e/ou aulas, no entanto, para que nos ajude também, cancele sempre que saiba que seja necessário.</p>
  <h3>Bom treino!!!</h3>
  <span><?php echo $msg; ?></span>
  <img id="img_index" src="../imagens/pexels-william-choquette-1954524.jpg" alt="gym">

</div>


</body>
</html>
