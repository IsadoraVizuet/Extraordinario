
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="Config.Conexion" %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ListarCliente</title>
    </head>
    <style>
        h2 {
            text-aling:center;
            font-family:arial;
            color:red;
        }
        td{
            text-align:center;
            font-family:arial;
            color:blue;
            font-size: 16;
        }
    </style>
    <body>
        <div align="center" width="200%";
             <br>
            <h2>Servicios</h2>
            <br>
            <div align="left" width="200%"></div>
            <% // llamada  otro jsp
                out.println("<a class='space' href='RegistrarCliente.jsp' ></a>");
             %>   
             <br>
             <table border="1" borderColor="pink">
                 <tr>
                    <td bgcolor="cyan" width="20"  align="center">Id Cliente</td>
                    <td bgcolor="cyan" width="100" align="center">Nombre del cliente</td>
                    <td bgcolor="cyan" width="100" align="center">Primer apellido del cliente</td>
                    <td bgcolor="cyan" width="100" align="center">Segundo apellido del cliente</td>
                    <td bgcolor="cyan" width="50"  align="center">Domicilio</td>
                    <td bgcolor="cyan" width="30"  align="center">telefono</td>
                    <td bgcolor="cyan" width="40"  align="left">correo</td>
           
                 </tr>
                 <% // Conexion a la BD
                    
                    Conexion cn=new Conexion();
                    Connection con;
                
                    Statement  st = null;
                    ResultSet  rs = null;
                    
                    String vlSQL ="select * from cliente order by id_cliente";
                    try {                                                
                         con=cn.getConexion(); 
                         
                         st  = con.createStatement();
                                    //System.out.println("Se conecto a la bd"); 
                         rs=st.executeQuery(vlSQL);
                         while (rs.next()) { 
                 %>
                 <tr>
                     <td><%=rs.getInt("id_cliente") %></td>
                     <td><%=rs.getString("nombre_cliente") %></td>
                     <td><%=rs.getString("primer_apellido") %></td>
                     <td><%=rs.getString("segundo_apellido") %></td>
                     <td><%=rs.getString("domicilio") %></td>
                     <td><%=rs.getInt("telefono") %></td>
                     <td><%=rs.getString("correo") %></td>
                     <td><input type="submit" value="Agregar al carrito"></td>
                 </tr>
                 <%
                         }
                         
                        rs.close(); 
                        st.close();
                        } catch (Exception e) {
                            System.out.println("Error:"+e);
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                        }
                    
                 %>
             </table>
       
    </body>
</html>
