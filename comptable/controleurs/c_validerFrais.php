<?php

include 'modele/m_ValiderFrais.php';

if(!isset($_REQUEST['id'])){
    $_REQUEST['id'] = 'null';
}
if(!isset($_REQUEST['mois'])){
    $_REQUEST['mois'] = 'null';
}
$id = trim(htmlentities($_REQUEST['id']));
$mois = trim(htmlentities($_REQUEST['mois']));

if(isset($id) && $id != 'null')
{
    if(isset($mois) && $mois != 'null')
    {
        $return = $pdo->ValiderFrais($id, $mois);
        if($return == true)
        {
            echo "<h1 style='text-align: center;'>fiche validée</h1>";
        }
        elseif ($return == false)
        {
            echo "<h1 style='text-align: center;'>fiche non validée du a une erreur</h1>";
        }
    }

}

$lesFraisForfait= $pdo->getLesFraisForfaitCR();

include 'vues/v_ValiderFrais.php';