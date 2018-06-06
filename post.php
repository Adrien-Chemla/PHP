<?php
    require_once("header.php");
    $user = 8;
    $id = $db->prepare("SELECT COUNT(id) as count FROM compte_bancaire WHERE id_user = ?");
    $id->execute(array($user));
    $count = $id->fetch()['count'];

    $name   = $_POST["nom"];
    $type   = $_POST["type"];
    $solde  = $_POST["solde"];
    $choix  = $_POST["devise"];

    if($count < 10){
        $req = $db->prepare("INSERT INTO compte_bancaire (nom, type, solde, devise, id_user) VALUES (:nom, :type, :solde, :devise, :id_user)");
        $req->execute(array(
            "nom" => $name,
            "type" => $type,
            "solde" => $solde,
            "devise" => $choix,
            "id_user" => $user
        ));
    if($req->rowCount() > 0) {
        echo ("Vos données ont bien été enregistrées !");
    } else {
        echo "Erreur à l'ajout";
    }
} else {
    echo "Vous avez atteint la limite maximum de comptes bancaires !";
}
?>