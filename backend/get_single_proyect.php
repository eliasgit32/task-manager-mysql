<?php include 'connection.php';

//Obtener los datos
$ID = $_GET['ID'];

$sql = "SELECT name, description FROM proyects WHERE ID = $ID";

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