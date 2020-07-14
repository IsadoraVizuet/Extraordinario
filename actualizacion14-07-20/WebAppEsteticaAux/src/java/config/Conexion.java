package config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try {
            
            String DRIVER = "com.mysql.jdbc.Driver";
            String URL ="jdbc:mysql://localhost:3306/mibd";
            String userName="root";
            String password="Ivr280201+";
              
            Class.forName(DRIVER);
            con=DriverManager.getConnection(URL,userName,password);
            
        } catch (Exception e) {
            System.err.println("Error en BD:"+e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
    }
    public Connection getConexion(){
        return con;
    }
}