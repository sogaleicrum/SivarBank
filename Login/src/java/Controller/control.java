package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import DAO.*;
import Model.*;

@WebServlet(name = "control", urlPatterns = {"/control"})
public class control extends HttpServlet {

    usuarioDAO usuario;

    public control() throws ClassNotFoundException {
        super();
        conexion cnx = new conexion();
        usuario = new usuarioDAO(cnx);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ruta = "";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("login")) {
            ruta = "inicio.jsp";

        } else if (action.equalsIgnoreCase("clientes")) {
            ruta = "clientes.jsp";
            try {
                request.setAttribute("usuario", usuario.llenarTabla());
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (action.equalsIgnoreCase("operaciones")) {
            ruta = "operaciones.jsp";
            try {
                request.setAttribute("llenarusuarios", usuario.llenarTabla());
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (action.equalsIgnoreCase("historial")) {
            ruta = "Historial.jsp";

            try {
                request.setAttribute("usuario", usuario.llenarTabla());
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (action.equalsIgnoreCase("agregarcliente")) {
            ruta = "agregarcliente.jsp";
            try {
                request.setAttribute("llenarcargo", usuario.llenarcargo());
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (action.equalsIgnoreCase("eliminar")) {
            ruta = "clientes.jsp";
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                usuario.eliminar(id);
                request.setAttribute("usuario", usuario.llenarTabla());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("actualizar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ruta = "agregarcliente.jsp";
            try {

                request.setAttribute("llenarcargo", usuario.llenarcargo());
                request.setAttribute("ret", usuario.llenarid(id));
            } catch (Exception e) {
            }

        } else if (action.equalsIgnoreCase("saldo")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ruta = "saldo.jsp";
            try {
                request.setAttribute("movimiento", usuario.llenarmov(id));
            } catch (Exception e) {
            }

        }
        RequestDispatcher dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        usuario u = new usuario();
        movimiento m = new movimiento();

        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("1")) {
            u.setUsuario(request.getParameter("usuario"));
            u.setPass(request.getParameter("pass"));
            try {
                if (usuario.validarUsuario(u)) {
                    if (usuario.validarPass(u)) {
                        request.setAttribute("persona", usuario.llenarData(u));
                        if (usuario.llenarData(u).getCargo().equalsIgnoreCase("Administrador")) {
                            RequestDispatcher dis = request.getRequestDispatcher("menu.jsp");
                            dis.forward(request, response);
                        } else if (usuario.llenarData(u).getCargo().equalsIgnoreCase("Cliente")) {
                            RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
                            dis.forward(request, response);
                        }
                    } else {
                        request.setAttribute("msj2", "Contraseña incorrecta");
                        RequestDispatcher dis = request.getRequestDispatcher("inicio.jsp");
                        dis.forward(request, response);
                    }

                } else {
                    request.setAttribute("msj1", "el usuario no está registrado");
                    RequestDispatcher dis = request.getRequestDispatcher("inicio.jsp");
                    dis.forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("2")) {
            String ruta = "";
            u.setNombre(request.getParameter("nombre"));
            u.setApellido(request.getParameter("apellido"));
            u.setUsuario(request.getParameter("usuario"));
            u.setPass(request.getParameter("pass"));
            u.setCargoint(Integer.parseInt((request.getParameter("cargoint"))));

            String id = request.getParameter("id");

            if ((id == null || id.isEmpty())) {
                ruta = "/clientes.jsp";
                usuario.insertar(u);
                try {
                    request.setAttribute("usuario", usuario.llenarTabla());
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            } else {
                u.setId(Integer.parseInt(id));
                ruta = "/clientes.jsp";
                usuario.Actualizar(u);
                try {
                    request.setAttribute("usuario", usuario.llenarTabla());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            RequestDispatcher dis = request.getRequestDispatcher(ruta);
            dis.forward(request, response);

        } else if (action.equalsIgnoreCase("3")) {
            String ruta = "";

            int num = Integer.parseInt(request.getParameter("selectmov"));
            if (num == 1) {
                m.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
                m.setFecha(request.getParameter("fecha"));
                m.setCargo(Double.parseDouble(request.getParameter("monto")));
                m.setAbono(0);
                ruta = "/operaciones.jsp";
                try {
                    request.setAttribute("llenarusuarios", usuario.llenarTabla());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                usuario.Operacion(m);

            } else if (num == 2) {
                m.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
                m.setFecha(request.getParameter("fecha"));
                m.setAbono(Double.parseDouble(request.getParameter("monto")));
                m.setCargo(0);
                ruta = "/operaciones.jsp";
                try {
                    request.setAttribute("llenarusuarios", usuario.llenarTabla());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                usuario.Operacion(m);
            }
            RequestDispatcher dis = request.getRequestDispatcher(ruta);
            dis.forward(request, response);

        }

    }

}
