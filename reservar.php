<?php
include("conexion.php");
session_start();
if (is_null($_SESSION['username'])) {
    header("location: index.php"); /* Redirect browser */
}
else {
    $id_usuario=$_REQUEST['idusu'];
    $id_recursos=$_REQUEST['idrec'];
    $id_reserva=$_REQUEST['idres'];
    date_default_timezone_set("Europe/Madrid");
    $localdate=("Y-m-d H:i:s");

    $q = "SELECT * FROM recursos";
    $consulta = mysqli_query($conexion, $q);
    if (mysqli_num_rows($consulta)>0) {
        while ($recursos=mysqli_fetch_array($consulta)){
            $reservarUno= "INSERT INTO reservas (`id_usuario`,`id_recursos`,`fecha_in_reserva`,`id_reserva`) VALUES ($id_usuario,$id_recursos,$localdate,$id_reserva)";
            mysqli_query($conexion, $reservarUno);

            if ($reservarUno==true) {
               $reservarDos ="UPDATE recursos SET estado_recursos = 'Reservado' WHERE id_recursos=$id_recursos";                
               mysqli_query($conexion, $reservarDos);    
           }
           header('location: home.php');
       }

   }

} 

?>

