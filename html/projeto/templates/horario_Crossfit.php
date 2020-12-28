<section id="treinos">
<h2><a href="list_instalacoes.php">Instalações</a> &gt; <a><?= $instalacao_info['localizacao'] ?></a> &gt; <a> <?= $modalidade['nome'] ?></a></h2>
  <section class="list">

    <div class="container-table100">
<div class="wrap-table100">
<div class="table100 ver1 m-b-110">
<table data-vertable="ver1">
<thead>
<?php $aux = $modalidade['ID'];?>
<tr class="row100 head">
<th class="column100 column1" data-column="column1"></th>
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
<td class="column100 column5" data-column="column5"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">09:30-10:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<?php $modalidade['ID'] = $aux + 19;?>
<td class="column100 column4" data-column="column4"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">10:30-11:30</td>
<td class="column100 column2" data-column="column2">--</td>
<?php $modalidade['ID'] = $aux + 12;?>
<td class="column100 column3" data-column="column3"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<?php $modalidade['ID'] = $aux + 28;?>
<td class="column100 column6" data-column="column3"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<?php $modalidade['ID'] = $aux + 41;?>
<td class="column100 column7" data-column="column7"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">11:30-12:30</td>
<td class="column100 column2" data-column="column2">--</td>
<?php $modalidade['ID'] = $aux + 7;?>
<td class="column100 column3" data-column="column3"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">12:30-13:30</td>
<?php $modalidade['ID'] = $aux;?>
<td class="column100 column2" data-column="column2"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">13:30-14:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">14:30-15:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<?php $modalidade['ID'] = $aux + 36;?>
<td class="column100 column7" data-column="column7"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">15:30-16:30</td>
<?php $modalidade['ID'] = $aux + 1;?>
<td class="column100 column2" data-column="column2"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
<td class="column100 column3" data-column="column3">--</td>
<?php $modalidade['ID'] = $aux + 15;?>
<td class="column100 column4" data-column="column4"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
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
<?php $modalidade['ID'] = $aux + 24;?>
<td class="column100 column5" data-column="column5"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
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
<td class="column100 column5" data-column="column5">--</td>
<td class="column100 column6" data-column="column6">--</td>
<td class="column100 column7" data-column="column7">--</td>
<td class="column100 column8" data-column="column8">--</td>
</tr>
<tr class="row100">
<td class="column100 column1" data-column="column1">19:30-20:30</td>
<td class="column100 column2" data-column="column2">--</td>
<td class="column100 column3" data-column="column3">--</td>
<td class="column100 column4" data-column="column4">--</td>
<td class="column100 column5" data-column="column5">--</td>
<?php $modalidade['ID'] = $aux + 32;?>
<td class="column100 column6" data-column="column6"><a href="descricao_aula.php?id=<?=$instalacao_info['id']?>&id_treino=<?=$modalidade['ID']?>">RESERVAR</td>
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
