<?php include 'connection.php';

//Obtener los datos
$ID_proyect = $_POST['ID_proyect'];
$ID = $_POST['ID'];
$finished = $_POST['finished'];

//Operación de actualización
$sql = "UPDATE tasks SET finished = $finished WHERE ID_proyect = $ID_proyect AND ID = $ID";

if($conn->query($sql) === TRUE) {
    echo 'Record updated';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>