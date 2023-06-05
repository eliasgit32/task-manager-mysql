<?php include 'connection.php';

//Obtener los datos
$ID = $_POST['ID'];

//Operación de eliminación
$sql = "DELETE FROM proyects WHERE ID = $ID";

if($conn->query($sql) === TRUE) {
    echo 'Record deleted';
} else {
    echo 'Error executing the query: ' . $conn->error;
}

$conn->close();
?>