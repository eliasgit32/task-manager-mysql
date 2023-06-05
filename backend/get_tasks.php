<?php include 'connection.php';

//Obtener ID del proyecto
$ID_proyect = $_GET['ID_proyect'];

$sql = "SELECT * FROM tasks WHERE ID_proyect = $ID_proyect ORDER BY ID ASC";

$result = $conn->query($sql);

if ($result){
    $rows = array();
    while($single_row = $result->fetch_assoc()) {
        $rows[] = $single_row;
    } 
} else {
    die ('Error executing the query: ' . $conn->error);
}

//Enviar datos
header('Conten-Type: application/json');
echo json_encode($rows);

$conn->close();
?>