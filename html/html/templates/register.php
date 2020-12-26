<?php include("header.php"); ?>
  <section id="register">
    <body>
        <form action="../action_register.php" method="post">
          <input type="text" name="email" placeholder="Email">
          <input type="password" name="password" placeholder="Password">
          <input type="text" name="nif" placeholder="NIF">
          <input type="text" name="nome" placeholder="Nome">
          <input type="text" name="num_telefone" placeholder="Número de telefone">
          <input type="submit" value="Registar">
        </form>
    </body>
  </section>
</html>
