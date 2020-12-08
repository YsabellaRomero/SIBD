<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <link href="layout.css" rel="stylesheet">
  </head>
  <body>

    <?php include("menu.php"); ?>

    <aside id="register">
      <form action="/register_action.php" method="post">

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
    </aside>

  </body>
</html>
