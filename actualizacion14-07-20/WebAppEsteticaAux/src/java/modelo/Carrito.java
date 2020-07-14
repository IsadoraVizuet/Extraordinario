package modelo;

public class Carrito {
    int item;
    int id_servicio;
    String nombre_servicio;
    String cve_tipo_servicio;
    double duracion;
    double precio;

    public Carrito() {
    }

    public Carrito(int item, int id_servicio, String nombre_servicio, String cve_tipo_servicio, double duracion, double precio) {
        this.item = item;
        this.id_servicio = id_servicio;
        this.nombre_servicio = nombre_servicio;
        this.cve_tipo_servicio = cve_tipo_servicio;
        this.duracion = duracion;
        this.precio = precio;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getNombre_servicio() {
        return nombre_servicio;
    }

    public void setNombre_servicio(String nombre_servicio) {
        this.nombre_servicio = nombre_servicio;
    }

    public String getCve_tipo_servicio() {
        return cve_tipo_servicio;
    }

    public void setCve_tipo_servicio(String cve_tipo_servicio) {
        this.cve_tipo_servicio = cve_tipo_servicio;
    }

    public double getDuracion() {
        return duracion;
    }

    public void setDuracion(double duracion) {
        this.duracion = duracion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

   

}
