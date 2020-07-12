<%-- 
    Document   : ListarServicio
    Created on : 09-jul-2020, 14:45:19
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="config.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
             <br>
            <h2>Servicios</h2>
            <br>
            <div align="left" width="200%"></div>
            <% // llamada  otro jsp
                out.println("<a class='space' href='insertarServicio.jsp' ></a>");
             %>   
             <br>
             <table border="1" borderColor="pink">
                 <tr>
                    <td bgcolor="cyan" width="20"  align="center">Id Servicio</td>
                    <td bgcolor="cyan" width="100" align="center">Nombre del Servicio</td>
                    <td bgcolor="cyan" width="50"  align="center">Tipo de Servicio</td>
                    <td bgcolor="cyan" width="30"  align="center">Duraci&oacute;n</td>
                    <td bgcolor="cyan" width="40"  align="left">Precio</td>
                    <td bgcolor="cyan" width="40"  align="left">Acci&oacute;n</td>
                 </tr>
                 <% // Conexion a la BD
                    
                    Conexion cn=new Conexion();
                    Connection con;
                
                    Statement  st = null;
                    ResultSet  rs = null;
                    
                    String vlSQL ="select * from cat_servicio order by id_servicio";
                    try {                                                
                         con=cn.getConexion(); 
                         
                         st  = con.createStatement();
                                    //System.out.println("Se conecto a la bd"); 
                         rs=st.executeQuery(vlSQL);
                         while (rs.next()) { 
                 %>
                 <tr>
                     <td><%=rs.getInt("id_servicio") %></td>
                     <td><%=rs.getString("nombre_servicio") %></td>
                     <td><%=rs.getString("cve_tipo_servicio") %></td>
                     <td><%=rs.getInt("duracion") %></td>
                     <td><%=rs.getInt("precio") %></td>
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
