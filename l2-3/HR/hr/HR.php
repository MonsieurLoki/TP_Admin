<!-- <html>
<head>
    <title>Catalogue WoodyHR</title>
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
    <h1>Catalogue WoodyHR</h1>

    <?php
    $dbname = 'woodyHR';
    $dbuser = 'root';
    $dbpass = 'mypass';
    $dbhost = 'composehr-mariadb-1';
    $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");
    mysqli_select_db($connect,$dbname) or die("Could not open the database '$dbname'");
    $result = mysqli_query($connect,"SELECT id, humain_firstname, humain_surname, groupe FROM humains");
    ?>

    <table>
        <tr>
            <th>Id</th>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Groupe</th>
        </tr>

        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr><td>".$row['id']."</td><td>".$row['humain_firstname']."</td><td>".$row['humain_surname']."</td><td>".$row['groupe']."</td></tr>";
        }
        ?>

    </table>
</body>
</html> -->

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personnel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Personnel</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Prénom</th>
                    <th>Nom</th>
                    <th>Groupe</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $dbname = 'woodyHR';
                $dbuser = 'root';
                $dbpass = 'mypass';
                $dbhost = 'composehr-mariadb-1';
                $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Impossible de se connecter à '$dbhost'");
                mysqli_select_db($connect,$dbname) or die("Impossible d'ouvrir la base de données '$dbname'");
                $result = mysqli_query($connect,"SELECT id, humain_firstname, humain_surname, groupe FROM humains");
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr><td>".$row['id']."</td><td>".$row['humain_firstname']."</td><td>".$row['humain_surname']."</td><td>".$row['groupe']."</td></tr>";
                }
                mysqli_close($connect);
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
