<?php
if(!isset($_REQUEST['action'])){
	$_REQUEST['action'] = 'demandeConnexion';
}
$action = trim(htmlentities($_REQUEST['action']));
switch($action){
	case 'demandeConnexion':{
		include("vues/v_connexion.php");
		break;
	}
	case 'valideConnexion':{
		$login = trim(htmlentities($_REQUEST['login']));
		$mdp = trim(htmlentities($_REQUEST['mdp']));
		$visiteur = $pdo->getInfosVisiteur($login,$mdp);
		$comptable = $pdo->getInfosComptable($login,$mdp);
		if(!is_array($comptable)){
			if(!is_array( $visiteur))
			{
				ajouterErreur("Login ou mot de passe incorrect");
				include("vues/v_erreurs.php");
				include("vues/v_connexion.php");
			}
			else
			{
				$id = $visiteur['id'];
				$nom =  $visiteur['nom'];
				$prenom = $visiteur['prenom'];
				connecter($id,$nom,$prenom);
				include("vues/v_sommaire.php");
				include("vues/v_accueil.php");
			}
		}
		else
		{
			
			$id = $comptable['id'];
			$nom =  $comptable['nom'];
			$prenom = $comptable['prenom'];
			connecter($id,$nom,$prenom);
			header('Location: comptable/index.php');
		}

		
		break;
	}
    case 'deconnexion':{
        session_destroy();
        header('Location: index.php');break;
    }
    case 'hash':{
        $pdo->hashMdpAllUser();
        include ('vues/v_connexion.php');break;
    }
	default :{
		include("vues/v_connexion.php");
		break;
	}
}
?>