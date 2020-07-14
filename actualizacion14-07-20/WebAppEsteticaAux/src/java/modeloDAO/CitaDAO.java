
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Carrito;
import modelo.Cita;


public class CitaDAO {
    Connection con;
    Conexion cn = new Conexion();

    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    public int GenerarCita(Cita cita){
        int id_cita;
        String vlSQL = "insert into cita (fecha,id_sucursal,id_cliente,costo_total,estatus,id_empleado,hora_inicio,duracion_cita)"
                   + "  values(?,?,?,?,?,?,?,?)";
                  
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);
            
           
            ps.setString(1,cita.getFecha());
           
           // ps.setDouble(2,cita.getId_sucursal());
            ps.setDouble(2,1);
            ps.setInt(3,cita.getId_cliente());
            ps.setDouble(4,cita.getCosto_total());
            ps.setString(5,cita.getEstatus());
           // ps.setInt(6,cita.getId_empleado());
            ps.setInt(6,1);
            ps.setString(7,cita.getHora_inicio());
            ps.setDouble(8,cita.getDuracion_cita());
            
            r=ps.executeUpdate();
            
            vlSQL="select @@IDENTITY AS id_cita";
            rs=ps.executeQuery(vlSQL);
            rs.next();
            id_cita=rs.getInt("id_cita");
            rs.close();
            
            //insertar los detalles de la cita
            for(Carrito detalle: cita.getDetalle_cita()){
                vlSQL="insert into detalle_cita (id_cita,id_servicio) values (?,?)";
                ps = con.prepareStatement(vlSQL);
                ps.setInt(1,id_cita);
                ps.setInt(2,detalle.getId_servicio());
                r=ps.executeUpdate();
            }   
            
            
        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return 0;
        }
      return id_cita;  
    }
    
}
