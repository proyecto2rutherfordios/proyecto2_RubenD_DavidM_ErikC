<?php
include_once "conexion.php";
if (isset ($_GET['logout'])) {
	session_start();
	session_destroy();

	unset($_SESSION['username']);

	header("location: index.php");
}

?> 


<!-- <?php
//include_once "conexion.php";
//if (isset ($_GET['logout'])) {
//session_start();
//session_destroy();
//header('location: index.php');
?> -->