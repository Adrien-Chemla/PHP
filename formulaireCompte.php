<!DOCTYPE html>
<html>
    <?php
        require_once("header.php");
    ?>
<body>
    <div>
        <form method="post" action="form.php">
            <label>Nom :</label>
            <input type="text" name="nom" placeholder="Nom de compte">
            <br>
            <label>Type de compte :</label>
            <select name="type">
                <option value="courant">Compte courant</option>
                <option value="epargne">Compte épargne</option>
                <option value="joint">Compte joint</option>
            </select>
            <br>
            <label>Solde :</label>
            <input type="number" name="solde" placeholder="100">
            <br>
            <label>Devise :</label>
            <select name="devise">
                <option value="EUR">Euros</option>
                <option value="USD">Dollars</option>
            </select>
            <br>
            <button Type="submit">Envoyer</button>
        </form>
    </div>
</body>
</html>