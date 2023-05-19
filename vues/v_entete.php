<!DOCTYPE html>
<html lang="fr">
  <head>
    <title>Intranet du Laboratoire Galaxy-Swiss Bourdin</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="./styles/styles.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
  </head>
  <?php
  $backgroundcolor = "#77AADD";
  if(!empty($_SESSION['role']))
  {
    $role = $_SESSION['role'];
  }
  else
  {
    $role = "null";
  }


  if ($role == "C")
  {
    $backgroundcolor = "pink";
  }
  ?>
  <body style="background-color: <?php echo $backgroundcolor; ?>;" >
    <div id="page">
      <div id="entete">
        <img src="./images/logo.jpg" id="logoGSB" alt="Laboratoire Galaxy-Swiss Bourdin" title="Laboratoire Galaxy-Swiss Bourdin" />
        <h1>Suivi du remboursement des frais</h1>
      </div>