package DAO;

import java.sql.*;

public class conexion {

    static String db = "log";
    static String user = "root";
    static String pass = "usbw";
    static String ruta = "jdbc:mysql://localhost/" + db;
    Connection cnx = null;

    public conexion() throws ClassNotFoundException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.cnx = DriverManager.getConnection(ruta, user, pass);
            if (this.cnx != null) {
                System.out.println("Conectado correctamente");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Connection conectar() {
        try {
            return this.cnx;
        } catch (Exception e) {
            return null;
        }
    }

    public void Desconectar() throws SQLException {
        this.cnx.close();
    }

}
