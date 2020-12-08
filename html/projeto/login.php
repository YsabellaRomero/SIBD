<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Log In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <link href="layout.css" rel="stylesheet">
  </head>
  <body>

    <?php include("menu.php"); ?>

    <aside id="login">
      <form action="/login_action.php" method="post">
        <label for="email">Email</label>
        <input type="text" id="user" name="email">
        <br>
        <label for="pwd">Password</label>
        <input type="password" id="pwd" name="password">
        <br>
        <input type="submit" value="Log in">
      </form>
    </aside>

  </body>
</html>
