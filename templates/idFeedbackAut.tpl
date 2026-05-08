<?php
/**
 @var $feedbacks
 */
?>
<?php $this->layout('home', ['title' => 'Carpooling']) ?>

<h2>Lista dei feedback dei passeggeri sugli autisti</h2>

<table border="1" style="width:100%; border-collapse: collapse; text-align: left;">
    <thead>
    <tr>
        <th>ID</th>
        <th>Voto</th>
        <th>Recensione</th>
        <th>ID Passeggero</th>
        <th>ID Autista</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($idFeedbackAut as $f): ?>
    <tr>
        <td><?= htmlspecialchars($f['idFeedback']) ?></td>
        <td><?= htmlspecialchars($f['voto']) ?></td>
        <td><?= htmlspecialchars($f['recensione']) ?></td>
        <td><?= htmlspecialchars($f['idPasseggero']) ?></td>
        <td><?= htmlspecialchars($f['idAutista']) ?></td>
    </tr>
    <?php endforeach; ?>
    </tbody>
</table>
