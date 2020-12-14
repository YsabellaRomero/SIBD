<?php
      session_start();
      $msg = $_SESSION["msg"];
      unset($_SESSION["msg"]);

      $title = "Criação de Password";
      include("menu.php");
?>

    <aside id="register">
      <form action="../register_action.php" method="post">

        <label for="mem_num">Membership Number</label>
        <input type="text" id="mem_num" name="mem_num">
        <br>
        <label for="email">Email</label>
        <input type="text" id="email" name="email">
        <br>
        <label for="pwd">Password</label>
        <input type="password" id="pwd" name="password">
        <br>
        <input type="submit" value="Create">
      </form>
      <span><?php echo $msg; ?></span>
    </aside>

  </body>
</html>
