<?php

function connexionBD()
{
    $login = "root";
    $pwd = "";
    $bdd = "gsbmvc";
    $server = "localhost";

    try{
        $cox = new PDO("mysql:host=$server;dbname=$bdd;charset=utf8",$login, $pwd);
        $cox->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $cox;
    }
    catch(PDOException $e){
        echo "ERREUR de connexion PDO ! ";
        die();
    }
}

$lesCles = array_keys($lesFrais);
foreach($lesCles as $unIdFrais){
    $qte = $lesFrais[$unIdFrais];
    $req = "update lignefraisforfait set lignefraisforfait.quantite = :qte
			where lignefraisforfait.idVisiteur = :idVisiteur and lignefraisforfait.mois = :mois
			and lignefraisforfait.idFraisForfait = :idFrais";
    $resultat = PdoGsb::$monPdo->prepare($req);
    $resultat->execute(array( ':idVisiteur' => $idVisiteur, ':mois' => $mois, ':idFrais' => $unIdFrais , ':qte' => $qte ));
}

$req = PdoGsb::$monPdo->prepare("SELECT * FROM lignefraisforfait where idVisiteur = '$idVisiteur'");
$result = $req->execute();
$resultLigneFrais = $result->fetchAll();

$req = PdoGsb::$monPdo->prepare("SELECT * FROM fraisforfait");
$result = $req->execute();
$resultFraisForfait = $result->fetchAll();

$montantValide = $resultLigneFrais;

