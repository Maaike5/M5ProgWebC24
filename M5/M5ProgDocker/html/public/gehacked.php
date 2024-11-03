<?php


include_once("../source/database.php");

$connection = database_connect();

$result = $connection->query("SELECT 'het werkt' as nice");

print_r($result->fetch_all());
?>

<?php
function ShowAllLeerlingen($conn)
{
    $q = "select * from leerlingen;";

    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result)
    {
        for ($i=0; $i < $result->num_rows; $i++)
        {
            $row = $result->fetch_assoc();
            print_r($row)
        }
    }
}