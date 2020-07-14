<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Bree+Serif|Hind+Madurai&display=swap" rel="stylesheet">
        <link href="css/estilos_aux.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-custom"> 
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">                 
                       <!-- <a id ="liga" class="navbar-brand" href="Controlador?accion=inicio">Inicio <span class="sr-only">(current)</span></a> -->
                       <a id ="liga" class="navbar-brand" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <!--<a  class="navbar-brand" href="Controlador?accion=inicio"> Seleccionar m&aacute;s servicios</a>  -->
                        <a  class="navbar-brand" href="Controlador?accion=SeleccionarMas"> Seleccionar m&aacute;s servicios</a>
                    </li>
                    
                </ul>
               
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Iniciar Sesi&oacute;n
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

        <div clas="container mt-4">
            <br>
            <h5>Servicios seleccionados</h5>
            <br>
            <div class="row">
                <div class="col-sm-8">  <!--Div para la tabla  de servicios seleccionados -->
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Servicio</th>
                                <th>Precio</th>
                                <th>Duraci&oacute;n</th>
                                <th>Acci&oacute;n</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.getItem()}</td>
                                    <td>${car.getNombre_servicio()}</td>
                                    <td>${car.getPrecio()}</td>
                                    <td>${car.getDuracion()}</td>
                                    <td>
                                        <intput type="hidden" id="id_servicio" value="${car.getId_servicio()}">
                                       <!--  no funciona -
                                       <a href="#" id="btnDelete" >Quitar del carrito</a> ->
                                       <!-- este si funciona -->
                                       <a href="Controlador?accion=Delete&id_servicio=${car.getId_servicio()}" >Quitar del carrito</a>
                                    </td>
                                   
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
                <div class="col-sm-4">   <!--Div para la seccion de agendar -->
                    <div class="card">
                        <div class="card-header">
                            <h3>Agendar Cita</h3>

                        </div>
                        <div class="card-body">
                            <label>Duracion Cita</label>
                            <input type="text" readonly="" class="form-control text-center" value="${duracionCita}">
                            <label>Precio total</label>
                            <input type="text" readonly="" class="form-control text-center" value="${totalCita}">
                            <label>Anticipo</label>
                            <input type="text" readonly="" class="form-control text-center" value="${anticipo}">
                        </div>
                        <div class="card-footer">
                            <a href="Controlador?accion=GuardarCita" class="btn btn-danger btn-block">Agendar Cita</a>
                           <!-- <a href="#" class="btn btn-info btn-block">Pagar Anticipo</a>-->
                  
                        </div>
                    </div>
                </div>
            </div>

        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
        <!--   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
         -->
    </body>
</html>
