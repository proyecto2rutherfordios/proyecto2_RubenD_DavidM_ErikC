<?php
        function verificar_login($user,$password,&$result) {
    //Conectamos con la base de datos dentro de la funcion
            $conexion=mysqli_connect("localhost", "root", "", "bd_proyecto2");
    //Hacemos la consulta para verificar el usuario y la contraseña
            $sql = "SELECT * FROM usuarios WHERE nombre_usuario = '$user' and password_usuario = '$password'";
    //Guardamos en $rec la consulta junto a la conexion
            $rec = mysqli_query($conexion,$sql);
    //ponemos el contador a 0
            $count = 0;
    //mientras en $row hayan filar que mostrar sumara el contador
            while($row = mysqli_fetch_object($rec))
            {
                $count++;
                $result = $row;
            }
    //si contador es igual a uno devolvemos el parametro para poder mostrarlo
            if($count == 1)
            {
                return 1;
            }
    //sino no devolvemos nada
            else
            {
                return 0;
            }
        }

// La primera condición es para saber si existe o no ya la variable de sesión que se va a crear cuando el usuario se logee
        if(!isset($_SESSION['userid']))
        {
    //Si la primera condición no pasa, haremos otra preguntando si el boton de login fue presionado
            if(isset($_POST['login']))
            {
                session_start();
        //Si el boton ha sido presionado llamamos a la funcion verificar_login() dentro de otra condición preguntando si resulta verdadero y le pasamos los valores ingresados como parámetros.
                if(verificar_login($_POST['user'],$_POST['password'],$result) == 1)
                {
            //Si el login es correcto abrimos sesion y añadimos las variables y lo enviamos a home.php.
                    $_SESSION['userid'] = $result;
                    $_SESSION['username'] = $_POST['user']; 
                    header("location:home.php");
                }
                else
                {
            //Si la función verificar_login() no pasa,se muestrara un mensaje de error.
                    echo '<div class="error">Su usuario es incorrecto, intentelo de nuevo.</div>';
                }
            }
            ?>


            <?php
        } else {
    //Si la variable de sesión ‘userid’ ya existe, que muestre el mensaje de saludo.
          echo 'Su usuario se ingreso correctamente.';
          echo '<a href="logout.php">Logout</a>';
      }
      ?>
      <!-- Ponemos estilo al mensaje de error -->
      <style type="text/css">
      .error{
        color: red;
        font-weight: bold;
        font-size: 30px;
        margin: 10px;
        text-align: center;
        background: white;
    }