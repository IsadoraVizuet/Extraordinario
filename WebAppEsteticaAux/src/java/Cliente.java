
import java.sql.*;

public class Cliente {
    private int    id_cliente;
    private String nombre;
    private String primer_apellido;
    private String segundo_apellido;
    private String domicilio;
    private int    telefono;
    private String correo;
         
   //Constructor
    public Cliente(){
    }
    
    // operaciones del cliente
    public Cliente verificarCliente(String correo,int idCliente){
        // objeto de la clase cliente
        Cliente cl = null;
        //objeto de conexion
        Connection cn=null;
        PreparedStatement ps=null;
        ResultSet rs= null;
        
        try {
           //hacer como en listarServicio cn=Conexion.getConexion();
            String vlSQL;
            vlSQL ="select * from cliente where id_cliente=? and correo=?";
            
        } catch (Exception e) {
        }
        
        return null; //corregir
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimer_apellido() {
        return primer_apellido;
    }

    public void setPrimer_apellido(String primer_apellido) {
        this.primer_apellido = primer_apellido;
    }

    public String getSegundo_apellido() {
        return segundo_apellido;
    }

    public void setSegundo_apellido(String segundo_apellido) {
        this.segundo_apellido = segundo_apellido;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
   
    
    
}
