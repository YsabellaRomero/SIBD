<?php
      session_start();
      $msg = $_SESSION["msg"];
      unset($_SESSION["msg"]);

      $title = "Criação de Password";
      include("menu.php");
?>

<header>
  <h1>Novo Registo</h1>
</header>

    <aside id="register">
      <form action="../register_action.php" method="post">

        <label for="mem_num">Número de conta</label>
        <input type="text" id="mem_num" name="mem_num">
        <label for="email">Email</label>
        <input type="text" id="email" name="email">
        <label for="pwd_reg">Password</label>
        <input type="password" id="pwd" name="password">
        <input type="submit" value="Criar">
      </form>
      <span><?php echo $msg; ?></span>
    </aside>

  </body>
</html>
