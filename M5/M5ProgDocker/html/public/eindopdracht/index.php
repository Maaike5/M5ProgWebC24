<?php


include_once("../source/database.php");

$connection = database_connect();

$result = $connection->query("SELECT 'het werkt' as nice");

print_r($result->fetch_all());
?>

<!DOCTYPE html>
<html>
<head>
    <title>Contact</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Contact</h1>
    <p>Naam: <?php echo $contact['Naam']; ?></p>
    <p>Telefoon: <?php echo $contact['Telefoon']; ?></p>
    <p>Email: <?php echo $contact['Email']; ?></p>
    <p>Adres: <?php echo $contact['Adres']; ?></p>
    <p>Openingstijden: <?php echo $contact['Openingstijden']; ?></p>
</body>
</html>