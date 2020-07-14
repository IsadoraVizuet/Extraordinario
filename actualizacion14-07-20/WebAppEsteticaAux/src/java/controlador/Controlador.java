package controlador;

import config.Fecha;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Carrito;
import modelo.Cita;
import modelo.Cliente;
import modelo.Pago;
import modelo.Servicio;

import modeloDAO.CitaDAO;
import modeloDAO.ClienteDAO;
import modeloDAO.PagoDAO;
import modeloDAO.ServicioDAO;

public class Controlador extends HttpServlet {

    ServicioDAO sdao = new ServicioDAO();
    Servicio serv = new Servicio();
    List<Servicio> servicios = new ArrayList<>();
    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    int idServ;
    int id_cita;
    int id_pago;
    Carrito car = new Carrito();

    double totalCita = 0.0;
    double duracionCita = 0.0;
    double anticipo = 0.0;
  

    //para la validacion del cliente
    Cliente cli = new Cliente();
    ClienteDAO cliDao = new ClienteDAO();
    
    //para la cita
    Cita    cita= new Cita();
    CitaDAO citaDAO = new CitaDAO();
    
    //para el pago
    Pago  pago = new Pago();
    PagoDAO pagoDAO = new PagoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        servicios = sdao.listar();
        switch (accion) {
            case "AgregarCarrito":
                //Obtener el id_servicio del name correspondiente en servicios.jsp
                idServ = Integer.parseInt(request.getParameter("id_servicio"));

                //Obtener el resto de los datos del servicio 
                serv = sdao.listarId(idServ);
                // item = item + 1;
                item = listaCarrito.size() + 1;

                //Crear un objeto de la clase carrito y ponerle los valores recuperados o calculados
                car = new Carrito();
                car.setItem(item);
                car.setId_servicio(serv.getId_servicio());
                car.setNombre_servicio(serv.getNombre_servicio());
                car.setCve_tipo_servicio(serv.getCve_tipo_servicio());
                car.setDuracion(serv.getDuracion());
                car.setPrecio(serv.getPrecio());

                // agregar el objeto carrito a la lista listaCarrito
                listaCarrito.add(car);

                //Se sigue mostrando los servicios (Servicios.jsp)
                // y tambien se le manda el tamaño de la listaCarrito para que
                // muestre el total de servicios agregados al carrito
                request.setAttribute("contador", listaCarrito.size());

                request.getRequestDispatcher("Controlador?accion=inicio").forward(request, response);
                break;
            case "Delete":

                idServ = Integer.parseInt(request.getParameter("id_servicio"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (idServ == listaCarrito.get(i).getId_servicio()) {
                        listaCarrito.remove(i);
                    }

                }

                for (int i = 0; i < listaCarrito.size(); i++) {
                    listaCarrito.get(i).setItem(i + 1);
                }

                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);

                break;
            case "carrito":
                totalCita = 0.0;
                duracionCita = 0.0;
                anticipo = 0.0;

                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalCita = totalCita + listaCarrito.get(i).getPrecio();
                    duracionCita = duracionCita + listaCarrito.get(i).getDuracion();
                }
                anticipo = totalCita * 0.5;

                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("totalCita", totalCita);
                request.setAttribute("duracionCita", duracionCita);
                request.setAttribute("anticipo", anticipo);

                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;
            case "Agendar":

                idServ = Integer.parseInt(request.getParameter("id_servicio"));

                //Obtener el resto de los datos del servicio 
                serv = sdao.listarId(idServ);
                //item = item + 1;
                item = listaCarrito.size() + 1;

                //Crear un objeto de la clase carrito y ponerle los valores recuperados o calculados
                car = new Carrito();
                car.setItem(item);
                car.setId_servicio(serv.getId_servicio());
                car.setNombre_servicio(serv.getNombre_servicio());
                car.setCve_tipo_servicio(serv.getCve_tipo_servicio());
                car.setDuracion(serv.getDuracion());
                car.setPrecio(serv.getPrecio());

                // agregar el objeto carrito a la lista listaCarrito
                listaCarrito.add(car);
                //calcular campos
                totalCita = 0.0;
                duracionCita = 0.0;
                anticipo = 0.0;
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalCita = totalCita + listaCarrito.get(i).getPrecio();
                    duracionCita = duracionCita + listaCarrito.get(i).getDuracion();
                }
                anticipo = totalCita * 0.5;

                //se mandan las variables
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("totalCita", totalCita);
                request.setAttribute("duracionCita", duracionCita);
                request.setAttribute("anticipo", anticipo);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;
            case "SeleccionarMas":
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=inicio").forward(request, response);
                break;

            case "RegistrarCliente":  //esto es para el cliente, pendiente reubicar codigo
                cli.setNombre(request.getParameter("nombre"));
                cli.setPrimer_apellido(request.getParameter("primer_apellido"));
                cli.setSegundo_apellido(request.getParameter("segundo_apellido"));
                cli.setDomicilio(request.getParameter("domicilio"));
                //cli.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                cli.setTelefono(Double.parseDouble(request.getParameter("telefono")));
                cli.setCorreo(request.getParameter("correo"));
                int idCliente = cliDao.addCliente(cli);
                            System.out.println("cliente="+idCliente);
                cli.setId_cliente(idCliente);

                request.setAttribute("cliente", cli);
                request.getRequestDispatcher("Cliente.jsp").forward(request, response);

                break;
            case "Ingresar":   //Esto es para la validacion del cliente, pendiente de reubicar este codigo
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                String correo = request.getParameter("correo");
                cli = cliDao.validar2(id_cliente, correo);
                if (cli.getId_cliente() > 0) {
                    request.setAttribute("cli", cli);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                }
                break;
            case "GuardarCita":   // esto es para la cita, pendiente re organizar 
                Fecha fecha = new Fecha();  
                //int id_cita;
                if (cli.getId_cliente()>0) {
                cita.setFecha(fecha.FechaBD());
                cita.setId_sucursal(1);
                //cita.setId_cliente(1);
                cita.setId_cliente(cli.getId_cliente());
                
                cita.setCosto_total(totalCita);
                cita.setEstatus("A");
                cita.setId_empleado(1); 
                cita.setHora_inicio(fecha.FechaBD());
                cita.setDuracion_cita(duracionCita);
                          
                cita.setDetalle_cita(listaCarrito);
                
                id_cita=citaDAO.GenerarCita(cita);
                        System.out.println("id_cita="+id_cita);
        
                request.setAttribute("monto_pago",anticipo );
                request.getRequestDispatcher("Pago.jsp").forward(request, response);  
                }
                else{
                    request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                }
                break;
            case "RegistrarPago" :       
                pago.setId_cita(id_cita);
                pago.setTipo_pago("A");
                pago.setMonto_pago(anticipo);
                pago.setNum_tarjeta(Double.parseDouble(request.getParameter("num_tarjeta")));
                pago.setFecha_vencimiento(request.getParameter("fecha_vencimiento"));
                pago.setNip(Double.parseDouble(request.getParameter("nip")));
               
                id_pago=pagoDAO.addPago(pago); 
                request.getRequestDispatcher("index.jsp").forward(request, response); 
                break;
            default:
                request.setAttribute("servicios", servicios);
                request.getRequestDispatcher("Servicios.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
