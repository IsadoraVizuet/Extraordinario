
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estetica Aux Pago</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Bree+Serif|Hind+Madurai&display=swap" rel="stylesheet">
        <link href="css/estilos_aux.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container mt-4 col-lg-10">
                    <div class="card cl-sm-10">
                        <div class="card-body" style="background-color:lavender;">
                            <form method="post" action="Controlador?accion=RegistrarPago">
                                <div class="form-group text-center">
                                    <h3>Pago de anticipo</h3>                             
                                </div>
                                <div class="form-group">
                                    <label>Importe del anticipo :$${monto_pago}</label>
                                </div>
                                <div class="form-group">
                                    <label>N&uacute;mero de tarjeta</label>
                                    <input type="text" name="num_tarjeta" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Fecha de vencimiento:</label>
                                    <input type="text" name="fecha_vencimiento" class="form-control" placeholder="mmyy">
                                </div>
                                <div class="form-group">
                                    <label>NIP:</label>
                                    <input type="text" name="nip" class="form-control">
                                </div>
                                
   
                                <input type="submit" name="accion" value="Pagar" class="btn btn-primary btn-block">
                            </form>
                        </div>    
                    </div>           
        </div>             


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    </body>
</html>

