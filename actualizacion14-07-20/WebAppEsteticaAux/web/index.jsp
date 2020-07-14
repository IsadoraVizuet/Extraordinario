<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estetica AUX</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Bree+Serif|Hind+Madurai&display=swap" rel="stylesheet">
        <link href="css/estilos_aux.css" rel="stylesheet" type="text/css"/>






    </head>
    <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
    <body>


        <nav class="navbar navbar-expand-lg navbar-custom"> 
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">Menu</span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="navbar-brand" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="navbar-brand" href="Conocenos.jsp">Con&oacute;cenos</a>
                    </li>
                    <li class="nav-item">
                        <!--<a class="navbar-brand" href="Servicios.jsp">Servicios</a>-->
                        <!--<a class="navbar-brand" href="Controlador?accion=inicio">Servicios</a>-->
                        <a class="navbar-brand" href="Controlador?accion=SeleccionarMas">Servicios</a>

                    </li>
                    <li class="nav-item">
                        <a class="navbar-brand" href="Contacto.jsp">Contacto</a>
                    </li> 
                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Iniciar sesi&oacute;n/Salir
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="Cliente.jsp">Iniciar</a>
                            <div class="dropdown-divider"></div>
                            <div class="text-center">
                                <a><img src="img/login.jpg" alt="80" width="80"/></a><br>



                                <label>${cli.getNombre()}${cli.getPrimer_apellido()}${cli.getSegundo_apellido()}</label> 


                            </div>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="index.jsp">Salir</a>
                        </div>
                    </li>   
                </ul>
            </div>
        </nav>



        <div class="container mt-2 bgimg">
            <br><br>
            <br><br>
            <br><br>
            <center><div class="nombrelogo">Est&eacute;tica<br>Aux</div></center>
            <br><br>
            <br><br>
            <br><br>
        </div>
        <div class="container mt-2 pie">
            <p><center>Bienvenidos a  Est&eacute;tica Aux. <br>Somos la mejor opci&oacute;n de dise&ntilde;o de imagen, belleza e higiene.</center></p>
        <p><center>Abierto de 9 am. a 4 pm. de lunes a viernes</center></p>  
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>
