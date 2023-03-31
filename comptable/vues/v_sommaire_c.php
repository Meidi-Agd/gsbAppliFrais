<div id="menuGauche">
     <div id="infosUtil">
    
        <h2>
		<?php  
			echo $_SESSION['prenom']."  ".$_SESSION['nom'];
		?>   
		</h2>
         <h3>Comptable</h3>    
      </div>  
        <ul id="menuList">
			<li class="smenu">
              <a href="index.php?uc=ValiderFrais" title="Valider fiche de frais ">Valider fiche de frais</a>
			</li>
            <br>
			<li class="smenu">
              <a href="index.php?uc=SuivrePaieFrais" title="Suivre paiment fiche de frais">Suivre paiment fiche de frais</a>
			</li>
            <br>
			<li class="smenu">
              <a href="index.php?uc=deconnexion" title="Se déconnecter">Déconnexion</a>
			</li>
         </ul>
        
    </div>