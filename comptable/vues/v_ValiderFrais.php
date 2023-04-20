
<table class="listeLegere">
<caption>Eléments forfaitisés </caption>
    <tr>
        <th>Date</th>
        <th>idVisiteur</th>
        <th>montant Valide :</th>
        <th>nbJustificatifs</th>
        <th>Validation</th>
    </tr>

    <?php

    foreach ( $lesFraisForfait as $unFraisForfait )
    {
        $dateModif = $unFraisForfait['dateModif'];
        $idVisiteur = $unFraisForfait['idVisiteur'];
        $montantValide = $unFraisForfait['montantValide'];
        $justificatif = $unFraisForfait['nbJustificatifs'];

        $idVisiteurV = $unFraisForfait['idVisiteur'];
        $moisV = $unFraisForfait['mois'];
        $link = "index.php?uc=ValiderFrais&id=$idVisiteurV&mois=$moisV";
        ?>
        <tr>
            <th> <?php echo $dateModif?></th>
            <td class="qteForfait"><?php echo $idVisiteur?> </td>
            <td class="qteForfait"><?php echo $montantValide?> € </td>
            <td class="qteForfait"><?php echo $justificatif?> </td>
            <td><a href="<?php echo $link;?>">Valider &#10004;</a></td>

        </tr>
        <?php } ?>

    </table>
    </div>