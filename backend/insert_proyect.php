<?php include 'connection.php';

//Obtener los datos
$name = $_POST['name'];
$description = $_POST['description'];

//Operación de inserción
$sql = "INSERT INTO proyects (name, description) 
        VALUES ('$name', '$description')";

if($conn->query($sql) === TRUE) {
    echo 'Record inserted';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>