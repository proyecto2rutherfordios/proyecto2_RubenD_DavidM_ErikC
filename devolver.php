<?php
include("conexion.php");
session_start();
if (is_null($_SESSION['username'])) {
    header("location: index.php"); /* Redirect browser */
}
else {
    $id=$_REQUEST['id'];

    $q = "SELECT * FROM recursos";
    $consulta = mysqli_query($conexion, $q);
    if (mysqli_num_rows($consulta)>0) {
        while ($recursos=mysqli_fetch_array($consulta)){
            if ($recursos["estado_recursos"]=="Reservado") {
                $q ="UPDATE recursos SET estado_recursos = 'Disponible' WHERE id_recursos=$id";
                mysqli_query($conexion, $q);
                header('location: home.php');

            }
            
            
        }

    } 


}

?>
