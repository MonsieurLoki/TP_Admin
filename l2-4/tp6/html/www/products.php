<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue WoodyToys</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            text-align: center;
            margin-top: 100px;
        }
        .box {
            border: 2px solid #333;
            padding: 20px;
            margin-bottom: 20px;
        }
        .small {
            font-size: 12px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        table,
        th,
        td {
            padding: 10px;
            border: 1px solid black;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Catalogue WoodyToys</h1>

    <?php
    $dbname = getenv('MARIADB_DATABASE');
    $dbhost = getenv('MARIADB_HOST');
    $dbpass = getenv('MARIADB_PASSWORD');
    $dbuser = getenv('MARIADB_USER');
    $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");
    mysqli_select_db($connect,$dbname) or die("Could not open the database '$dbname'");
    $result = mysqli_query($connect,"SELECT id, product_name, product_price FROM products");
    ?>

    <table>
        <tr>
            <th>Numéro de produit</th>
            <th>Descriptif</th>
            <th>Prix</th>
        </tr>

        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr><td>".$row['id']."</td><td>".$row['product_name']."</td><td>".$row['product_price']."</td></tr>";
        }
        ?>

    </table>

    <a href="https://www.l2-4.ephec-ti.be" class="button">Retour à l'accueil</a>
</div>

</body>
</html>



<!-- <html>
<head>
    <title>Catalogue WoodyToys</title>
    <style>
        table,
        th,
        td {
            padding: 10px;
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>

<body>
    <h1>Catalogue WoodyToys</h1>

    <?php
    $dbname = getenv('MARIADB_DATABASE');
    $dbhost = getenv('MARIADB_HOST');
    $dbpass = getenv('MARIADB_PASSWORD');
    $dbuser = getenv('MARIADB_USER');
    $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");
    mysqli_select_db($connect,$dbname) or die("Could not open the database '$dbname'");
    $result = mysqli_query($connect,"SELECT id, product_name, product_price FROM products");
    ?>

    <table>
        <tr>
            <th>Numéro de produit</th>
            <th>Descriptif</th>
            <th>Prix</th>
        </tr>

        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr><td>".$row['id']."</td><td>".$row['product_name']."</td><td>".$row['product_price']."</td></tr>";
        }
        ?>

    </table>
</body>
</html> -->