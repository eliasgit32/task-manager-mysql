<?php include 'connection.php';

$sql = "SELECT * FROM proyects ORDER BY ID DESC";

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