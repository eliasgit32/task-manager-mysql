<?php include 'connection.php';

//Obtener los datos
$ID_proyect = $_POST['ID_proyect'];
$ID = $_POST['ID'];

//Operación de eliminación
$sql = "DELETE FROM tasks WHERE ID_proyect = $ID_proyect AND ID = $ID";

if($conn->query($sql) === TRUE) {
    echo 'Record deleted';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>