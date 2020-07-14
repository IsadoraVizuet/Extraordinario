
package modelo;

import java.util.List;


public class Cita {
     private int id_cita;
     private String fecha;
     private double id_sucursal;
     private int id_cliente;
     private double costo_total;
     private String estatus;
     private int id_empleado;
     private String hora_inicio;
     private double duracion_cita;
     
     private List<Carrito> detalle_cita;

    public Cita() {
    }

    public Cita(String fecha, double id_sucursal, int id_cliente, double costo_total, String estatus, int id_empleado, String hora_inicio, double duracion_cita, List<Carrito> detalle_cita) {
        this.fecha = fecha;
        this.id_sucursal = id_sucursal;
        this.id_cliente = id_cliente;
        this.costo_total = costo_total;
        this.estatus = estatus;
        this.id_empleado = id_empleado;
        this.hora_inicio = hora_inicio;
        this.duracion_cita = duracion_cita;
        this.detalle_cita = detalle_cita;
    }

    public List<Carrito> getDetalle_cita() {
        return detalle_cita;
    }

    public void setDetalle_cita(List<Carrito> detalle_cita) {
        this.detalle_cita = detalle_cita;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getId_sucursal() {
        return id_sucursal;
    }

    public void setId_sucursal(double id_sucursal) {
        this.id_sucursal = id_sucursal;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public double getCosto_total() {
        return costo_total;
    }

    public void setCosto_total(double costo_total) {
        this.costo_total = costo_total;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(String hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public double getDuracion_cita() {
        return duracion_cita;
    }

    public void setDuracion_cita(double duracion_cita) {
        this.duracion_cita = duracion_cita;
    }



    
   
    
     
}
