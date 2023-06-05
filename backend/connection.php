<?php
//Crear conexión
$conn = mysqli_connect(
  'localhost:3306',
  'root',
  '',
  'tasks_manager'
);

// Verificar la conexión
if ($conn->connect_error) {
  echo("Error al conectar a la base de datos: " . $conn->connect_error);
} 
  
?>