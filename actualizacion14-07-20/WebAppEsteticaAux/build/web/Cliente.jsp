
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estetica Aux Login</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Bree+Serif|Hind+Madurai&display=swap" rel="stylesheet">
        <link href="css/estilos_aux.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container mt-4 col-lg-10">
            
            <div class="row">
                <div class="col-sm-4"> 
                    <div class="card cl-sm-6">
                        <div class="card-body">
                            <form method="post" action="Controlador?accion=Ingresar">
                                <div class="form-group text-center">
                                    <h3>Iniciar Sesi&oacute;n</h3>
                                    <img src="img/login.jpg" height="170" width="170"/>

                                </div>
                                <div class="form-group">
                                    <label>Correo electr&oacute;nico</label>
                                    <input type="email" name="correo" class="form-control" placeholder="ejemplo@gmail.com">
                                </div>
                                <div class="form-group">
                                    <label>N&uacute;mero de Cliente</label>
                                    <input type="password" name="id_cliente" class="form-control">
                                </div>
                                <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                            </form>
                        </div>
                    </div>
                </div> 
                <div class="col-sm-8"> 
                    <div class="card cl-sm-10">
                        <div class="card-body" style="background-color:lavender;">
                            <form method="post" action="Controlador?accion=RegistrarCliente">
                                <div class="form-group text-center">
                                    <h3>Registrarse</h3>                             
                                </div>
                                <div class="form-group">
                                    <label>Id Cliente:${cliente.getId_cliente()}</label>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <input type="text" name="nombre" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <input type="text" name="primer_apellido" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <input type="text" name="segundo_apellido" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Domicilio:</label>
                                    <input type="text" name="domicilio" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Tel&eacute;fono:</label>
                                    <input type="text" name="telefono" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Correo electr&oacute;nico:</label>
                                    <input type="email" name="correo" class="form-control" placeholder="ejemplo@gmail.com">
                                </div>
   
                                <input type="submit" name="accion" value="Registrar" class="btn btn-primary btn-block">
                            </form>
                        </div>    
                    </div>    
                </div>
            </div>    
        </div>             


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    </body>
</html>
