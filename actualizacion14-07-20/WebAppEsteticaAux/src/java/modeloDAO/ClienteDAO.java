package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Cliente;

public class ClienteDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int resultado = 0;

    public Cliente validar2(int id_cliente, String correo) {
        Cliente cli = new Cliente();
        String vlSQL = "select * from cliente where id_cliente=? and correo=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);
            ps.setInt(1, id_cliente);
            ps.setString(2, correo);
            rs = ps.executeQuery();

            while (rs.next()) {
                resultado = resultado + 1;
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setNombre(rs.getString("nombre"));
                cli.setPrimer_apellido(rs.getString("primer_apellido"));
                cli.setSegundo_apellido(rs.getString("segundo_apellido"));
                cli.setDomicilio(rs.getString("domicilio"));
                cli.setTelefono(rs.getDouble("telefono"));
                cli.setCorreo(rs.getString("correo"));
            }

        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());

        }
        return cli;
    }

    public int validar(Cliente cli) {
        String vlSQL = "select * from cliente where id_cliente=? and correo=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);
            ps.setInt(1, cli.getId_cliente());
            ps.setString(2, cli.getCorreo());
            rs = ps.executeQuery();

            while (rs.next()) {
                resultado = resultado + 1;
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setNombre(rs.getString("nombre"));
                cli.setPrimer_apellido(rs.getString("primer_apellido"));
                cli.setSegundo_apellido(rs.getString("segundo_apellido"));
                cli.setDomicilio(rs.getString("domicilio"));
                cli.setTelefono(rs.getDouble("telefono"));
                cli.setCorreo(rs.getString("correo"));
            }
            if (resultado == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return 0;
        }
    }

    public int addCliente(Cliente cli) {
        int id_cliente;
        String vlSQL = "insert into cliente (nombre,primer_apellido,segundo_apellido,domicilio,telefono,correo)"
                + " values (?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);

            ps.setString(1, cli.getNombre());
            ps.setString(2, cli.getPrimer_apellido());
            ps.setString(3, cli.getSegundo_apellido());
            ps.setString(4, cli.getDomicilio());
            ps.setDouble(5, cli.getTelefono());
            ps.setString(6, cli.getCorreo());
           
            ps.executeUpdate();
            
            vlSQL="select @@IDENTITY AS id_cliente";
            rs=ps.executeQuery(vlSQL);
            rs.next();
            id_cliente=rs.getInt("id_cliente");
            rs.close();

            return id_cliente;
           
        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return 0;
        }
    }
}
