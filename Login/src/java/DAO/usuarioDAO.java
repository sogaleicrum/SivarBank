package DAO;

import java.sql.*;
import Model.*;
import java.util.ArrayList;

/**
 *
 * @author jason.rodriguezusam
 */
public class usuarioDAO {

    conexion cn;

    public usuarioDAO(conexion c) {
        this.cn = c;
    }

    public boolean validarUsuario(usuario u) throws SQLException {

        boolean resul = false;
        int conta = 0;
        String query = "Select count(*)res from usuario where usuario='" + u.getUsuario() + "'";
        Statement st = this.cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            conta = rt.getInt("res");
        }
        if (conta != 0) {
            resul = true;
        }
        return resul;
    }

    public boolean validarPass(usuario u) throws SQLException {

        boolean resul = false;
        int conta = 0;
        String query = "Select count(*)res from usuario where usuario='" + u.getUsuario() + "' and pass='" + u.getPass() + "'";
        Statement st = this.cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            conta = rt.getInt("res");
        }
        if (conta != 0) {
            resul = true;
        }
        return resul;
    }

    public usuario llenarData(usuario u) throws SQLException {

        usuario us = new usuario();
        //String query = "select * from usuario where usuario='" + u.getUsuario() + "' and pass='"+u.getPass()+"'";
        String query = "select us.id id, us.nombre nombre, us.apellido apellido,c.cargo cargo from usuario us inner join cargo c on c.id = us.cargo where us.usuario='" + u.getUsuario() + "' and us.pass='" + u.getPass() + "'";
        Statement st = this.cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            us.setId(rt.getInt("id"));
            us.setNombre(rt.getString("nombre"));
            us.setApellido(rt.getString("apellido"));
            us.setCargo(rt.getString("cargo"));

        }

        return us;
    }

    public ArrayList<usuario> llenarTabla() throws SQLException {
        String query = "select id , nombre, apellido from usuario order by id;";

        ArrayList<usuario> base = new ArrayList<usuario>();
        Statement st = cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            usuario u = new usuario();
            u.setId(rt.getInt("id"));
            u.setNombre(rt.getString("nombre"));
            u.setApellido(rt.getString("apellido"));

            base.add(u);
        }
        return base;
    }

    public ArrayList<cargo> llenarcargo() throws SQLException {
        String query = "SELECT * FROM cargo";
        ArrayList<cargo> base = new ArrayList<cargo>();
        Statement st = cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            cargo c = new cargo();
            c.setId(rt.getInt("id"));
            c.setCargo(rt.getString("cargo"));
            base.add(c);
        }

        return base;
    }

    public void insertar(usuario u) {
        String query = "insert into usuario(nombre, apellido,usuario,pass,cargo) values (?,?,?,?,?)";

        try {
            PreparedStatement st = cn.conectar().prepareStatement(query);
            st.setString(1, u.getNombre());
            st.setString(2, u.getApellido());
            st.setString(3, u.getUsuario());
            st.setString(4, u.getPass());
            st.setInt(5, u.getCargoint());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void eliminar(int id) {
        String query = "Delete from usuario where id =?";

        try {
            PreparedStatement st = cn.conectar().prepareStatement(query);
            st.setInt(1, id);
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public usuario llenarid(int id) throws SQLException {
        String query = "select * from usuario where id='" + id + "'";
        Statement st = cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);

        usuario u = new usuario();
        while (rt.next()) {
            u.setId(rt.getInt("id"));
            u.setNombre(rt.getString("nombre"));
            u.setApellido(rt.getString("apellido"));
            u.setUsuario(rt.getString("usuario"));
            u.setPass(rt.getString("pass"));
            u.setCargoint(rt.getInt("cargo"));

        }
        return u;
    }

    public ArrayList<usuario> llenarusuarios(int id) throws SQLException {
        String query = "select id, nombre,apellido from usuario";
        ArrayList<usuario> base = new ArrayList<usuario>();
        Statement st = cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            usuario c = new usuario();
            c.setId(rt.getInt("id"));
            c.setNombre(rt.getString("nombre"));
            c.setApellido(rt.getString("apellido"));
            base.add(c);
        }

        return base;

    }

    public ArrayList<movimiento> llenarmov(int id) throws SQLException {
        String query = "SELECT fecha, cargo, abono, saldo FROM log.movimiento where idusuario ='" + id + "'";
        ArrayList<movimiento> mv = new ArrayList<movimiento>();
        Statement st = cn.conectar().createStatement();
        ResultSet rt = st.executeQuery(query);
        while (rt.next()) {
            movimiento m = new movimiento();
            m.setFecha(rt.getString("fecha"));
            m.setCargo(rt.getDouble("cargo"));
            m.setAbono(rt.getDouble("abono"));
            m.setSaldo(rt.getDouble("saldo"));
            mv.add(m);
        }

        return mv;

    }

    public void Actualizar(usuario u) {
        String query = "Update usuario set Nombre =?, apellido =?,usuario =?, pass =?, cargo =?  where id=?";
        try {
            PreparedStatement st = cn.conectar().prepareStatement(query);
            st.setString(1, u.getNombre());
            st.setString(2, u.getApellido());
            st.setString(3, u.getUsuario());
            st.setString(4, u.getPass());
            st.setInt(5, u.getCargoint());
            st.setInt(6, u.getId());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();

        }

    }

    public void Operacion(movimiento m) {
        String query = "call log.operaciones1(?, ?, ?, ?);";
        try {
            PreparedStatement st = cn.conectar().prepareStatement(query);
            st.setInt(1, m.getIdusuario());
            st.setString(2, m.getFecha());
            st.setDouble(3, m.getCargo());
            st.setDouble(4, m.getAbono());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();

        }

    }

}
