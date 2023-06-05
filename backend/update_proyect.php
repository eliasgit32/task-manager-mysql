<?php include 'connection.php';

//Obtener los datos
$ID = $_POST['ID'];
$name = $_POST['name'];
$description = $_POST['description'];

//Operación de actualización
$sql = "UPDATE proyects SET name = '$name', description = '$description'
        WHERE ID = $ID";

if($conn->query($sql) === TRUE) {
    echo 'Record updated';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>