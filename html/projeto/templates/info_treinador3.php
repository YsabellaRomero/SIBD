<section id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a href="list_opcoes_instalacoes.php?id=<?=$instalacao_info['id']?>"><?= $instalacao_info['localizacao'] ?></a> &gt; <a href="list_pt.php?id=<?=$instalacao_info['id']?>">Treino Pessoal</a></h2>
  <section class="list">

    <h4>Telefone: <?= $treinador['numero_telemovel']?></h4>
    <h4>Email: <?= $treinador['email']?></h4>

    <?php if( $instalacao_info['id'] == 121 ) {
      $id_treino = 601;
    }

    else if( $instalacao_info['id'] == 123 ) {
      $id_treino = 701;
    }

    else {
      $id_treino = 801;
    }
?>

    <div class="container-table100">
<div class="wrap-table100">
<div class="table100 ver1 m-b-110">
<table data-vertable="ver1">
<thead>
<?php $aux = $id_treino; ?>
<tr class="row100 head">
<th class="column100 column1" data-column="column1"><?= $treinador['name']?></th>
<th class="column100 column2" data-column="column2">Segunda-feira</th>
<th class="column100 column3" data-column="column3">Terça-feira</th>
<th class="column100 column4" data-column="column4">Quarta-feira</th>
<th class="column100 column5" data-column="column5">Quinta-feira</th>
<th class="column100 column6" data-column="column6">Sexta-feira</th>
<th class="column100 column7" data-column="column7">Sábado</th>
<th class="column100 column8" data-column="column8">Domingo</th>
</tr>
</thead>
<tbody>
<tr class="row100">
<td class="column100 column1" data-column="column1">08:30-09:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<?php $id_treino = $aux + 21; ?>
<td class="column100 column7" data-column="column7"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">09:30-10:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<?php $id_treino = $aux + 9; ?>
<td class="column100 column4" data-column="column4"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">10:30-11:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">11:30-12:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">12:30-13:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">13:30-14:30</td>
<?php $id_treino = $aux + 2; ?>
<td class="column100 column2" data-column="column2"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<?php $id_treino = $aux + 14; ?>
<td class="column100 column5" data-column="column5"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">14:30-15:30</td>
<td class="column100 column2" data-column="column2">--</td>
<?php $id_treino = $aux + 8; ?>
<td class="column100 column3" data-column="column3"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<?php $id_treino = $aux + 20; ?>
<td class="column100 column6" data-column="column6"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">15:30-16:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">16:30-17:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">17:30-18:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">18:30-19:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<?php $id_treino = $aux + 17; ?>
<td class="column100 column5" data-column="column5"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">19:30-20:30</td>
<?php $id_treino = $aux + 5; ?>
<td class="column100 column2" data-column="column2"><a href="descricao_pt.php?id=<?=$instalacao_info['id']?>&nif=<?=$treinador['NIF']?>&id_treino=<?=$id_treino?>&th=3">RESERVAR</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
</tbody>
</table>
</div>
</div>

  </section>

</section>


</body>
</html>
