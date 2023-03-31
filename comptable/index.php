<?php
session_start();
require_once("include/fct.inc.php");
require_once ("modele/class.pdogsb.inc.php");
include("vues/v_entete_c.php");
include("vues/v_sommaire_c.php");

$pdo = PdoGsb::getPdoGsb();
$estConnecte = estConnecte();
if(!isset($_REQUEST['uc']) || !$estConnecte){
$_REQUEST['uc'] = 'connexion';
}
$uc = trim(htmlentities($_REQUEST['uc']));
switch($uc){
    case 'ValiderFrais':{
        include("controleurs/c_validerFrais.php");break;
    }
    case 'SuivrePaieFrais' :{
        include("controleurs/c_SuivrePaieFrais.php");break;
    }
    case 'deconnexion':{
        session_destroy();
        header('Location: ../index.php');break;
    }
    default: {
        include('vues/v_accueil.php');break;
    }

}

include("vues/v_pied_c.php");
?>