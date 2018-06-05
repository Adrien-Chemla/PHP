<!DOCTYPE>
<html>
    <?php
        require_once("header.php");

        $req = $db -> prepare("SELECT * FROM category");
        $req -> execute(array());
        $dataCategory = $req -> fetchAll();
        foreach($dataCategory as $data){
            echo $data['name'];
        }
    ?>
    <body>

    </body>
</html>