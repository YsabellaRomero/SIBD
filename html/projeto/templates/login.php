<?php
  session_start();
  $msg = $_SESSION["msg"];
  unset($_SESSION["msg"]);
  $title = "Página Login";
  include("menu.php");

?>

    <aside id="login">
      <form action="../login_action.php" method="post">

        <label for="email">Email</label>
        <input type="text" id="user" name="email">
        <br>
        <label for="pwd">Password</label>
        <input type="password" id="pwd" name="password">
        <br>
        <input type="submit" value="Log in">
      </form>
      <span><?php echo $msg; ?></span>
    </aside>

  </body>
</html>
