<?php
include "include/fct.inc.php";
include "modele/class.pdogsb.inc.php";
$pdo = PdoGsb::getPdoGsb();

if($pdo->hashMdpAllUser() == true)
{
    echo "true";
}
else
{
    echo "false";
}


