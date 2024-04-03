<html>
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
</html>