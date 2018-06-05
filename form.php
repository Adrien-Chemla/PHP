<?php
    require_once("header.php");
    
    $name   = $_POST["nom"];
    $type   = $_POST["type"];
    $solde  = $_POST["solde"];
    $choix  = $_POST["devise"];

    $req= $db->prepare("INSERT INTO compte_bancaire (nom, type, solde, devise) VALUES (:nom, :type, :solde, :devise)");
    $req->execute(array(
        "nom" => $name,
        "type" => $type,
        "solde" => $solde,
        "devise" => $choix
    ));

    if($req->rowCount() > 0) {echo ("Vos données ont bien été enregistrées !");}
    else {echo "Erreur à l'ajout";}
?>