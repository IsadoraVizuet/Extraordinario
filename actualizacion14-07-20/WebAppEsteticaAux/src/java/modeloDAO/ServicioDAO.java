package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Servicio;

public class ServicioDAO {

    Connection con;
    Conexion cn = new Conexion();

    PreparedStatement ps;
    ResultSet rs;

    public Servicio listarId(int id_servicio) {
        String vlSQL = "select * from cat_servicio where id_servicio=" + id_servicio;
        Servicio vlServ = new Servicio();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);
            rs = ps.executeQuery();

            while (rs.next()) {

                vlServ.setId_servicio(rs.getInt("id_servicio"));
                vlServ.setNombre_servicio(rs.getString("nombre_servicio"));
                vlServ.setCve_tipo_servicio(rs.getString("cve_tipo_servicio"));
                vlServ.setDuracion(rs.getDouble("duracion"));
                vlServ.setPrecio(rs.getDouble("precio"));
            }

        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return vlServ;
    }

    public List listar() {
        List<Servicio> servicios = new ArrayList();
        String vlSQL = "select * from cat_servicio order by id_servicio";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);
            rs = ps.executeQuery();

            while (rs.next()) {
                Servicio vlServ = new Servicio();
                vlServ.setId_servicio(rs.getInt("id_servicio"));
                vlServ.setNombre_servicio(rs.getString("nombre_servicio"));
                vlServ.setCve_tipo_servicio(rs.getString("cve_tipo_servicio"));
                vlServ.setDuracion(rs.getDouble("duracion"));
                vlServ.setPrecio(rs.getDouble("precio"));

                servicios.add(vlServ);
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return servicios;
    }
}
