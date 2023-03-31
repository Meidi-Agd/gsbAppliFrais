<div class="erreur">
<div class="alert alert-danger">
<?php 
foreach($_REQUEST['erreurs'] as $erreur)
	{
      echo $erreur;
	}
?>
</div></div>
