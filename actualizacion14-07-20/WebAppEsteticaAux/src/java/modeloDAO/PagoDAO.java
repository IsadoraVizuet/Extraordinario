package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Pago;

public class PagoDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int resultado = 0;

    public int addPago(Pago pago) {
        int id_pago;
        String vlSQL = "insert into pago (id_cita,tipo_pago,monto_pago,num_tarjeta,fecha_vencimiento,nip)"
                + " values (?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(vlSQL);

            ps.setInt(1, pago.getId_cita());
            ps.setString(2, pago.getTipo_pago());
            ps.setDouble(3, pago.getMonto_pago());
            ps.setDouble(4, pago.getNum_tarjeta());
            ps.setString(5, pago.getFecha_vencimiento());
            ps.setDouble(6, pago.getNip());

            ps.executeUpdate();

            vlSQL = "select @@IDENTITY AS id_pago";
            rs = ps.executeQuery(vlSQL);
            rs.next();
            id_pago = rs.getInt("id_pago");
            rs.close();

            return id_pago;

        } catch (Exception e) {
            System.out.println("Error:" + e);
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return 0;
        }
    }

}
