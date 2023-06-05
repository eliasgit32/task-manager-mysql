<?php include 'connection.php';

//Obtener los datos
$ID_proyect = $_POST['ID_proyect'];
$name = $_POST['name'];

//Operación de inserción
$sql = "INSERT INTO tasks (ID_proyect, name) 
        VALUES ($ID_proyect, '$name')";

if($conn->query($sql) === TRUE) {
    echo 'Record inserted';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>