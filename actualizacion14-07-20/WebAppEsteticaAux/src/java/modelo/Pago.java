package modelo;

public class Pago {

    private int id_pago;
    private int id_cita;
    private String tipo_pago;
    private double monto_pago;
    private double num_tarjeta;
    private String fecha_vencimiento;
    private double nip;

    public Pago() {
    }

    public Pago(int id_pago, int id_cita, String tipo_pago, double monto_pago, double num_tarjeta, String fecha_vencimiento, double nip) {
        this.id_pago = id_pago;
        this.id_cita = id_cita;
        this.tipo_pago = tipo_pago;
        this.monto_pago = monto_pago;
        this.num_tarjeta = num_tarjeta;
        this.fecha_vencimiento = fecha_vencimiento;
        this.nip = nip;
    }

    public double getNip() {
        return nip;
    }

    public void setNip(double nip) {
        this.nip = nip;
    }

    public int getId_pago() {
        return id_pago;
    }

    public void setId_pago(int id_pago) {
        this.id_pago = id_pago;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public String getTipo_pago() {
        return tipo_pago;
    }

    public void setTipo_pago(String tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

    public double getMonto_pago() {
        return monto_pago;
    }

    public void setMonto_pago(double monto_pago) {
        this.monto_pago = monto_pago;
    }

    public double getNum_tarjeta() {
        return num_tarjeta;
    }

    public void setNum_tarjeta(double num_tarjeta) {
        this.num_tarjeta = num_tarjeta;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    
    
    
    
}
