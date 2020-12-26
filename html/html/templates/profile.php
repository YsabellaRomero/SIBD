 <section id="Profile">
   <body>
     <h2>Email: <?=$emailconta?></h2>
       <h2>Nome: <?=$clientinfo['Nome']?></h2>
       <h2>NIF: <?=$clientinfo['NIF']?></h2>
       <h2>Número de telefone: <?=$clientinfo['Num_telefone']?></h2>
    <div class="profile-options">
      <ul>
        <li><a href="/templates/changedata.php?data=Nome">Alterar nome</li>
        <li><a href="/templates/changedata.php?data=NIF">Alterar NIF</li>
        <li><a href="/templates/changedata.php?data=Num_telefone">Alterar número de telefone</li>
        <li><a href="/templates/changedata.php?data=Password">Alterar Password</li>
      </ul>
    </div>
   </body>
 </section>
