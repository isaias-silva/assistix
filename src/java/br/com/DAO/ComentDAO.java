package br.com.DAO;

import br.com.model.Coment;
import java.sql.Connection;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComentDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Coment> lista = new ArrayList();
    ArrayList<Integer> notas = new ArrayList();

    public void comentar(Coment comentario) throws ClassNotFoundException {
        String sql = "insert into comentario (comentador,comentario,nota,id_filme,data_comentario) values (?,?,?,?,?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {

            pstm = con.prepareStatement(sql);
            pstm.setString(1, comentario.getComentador());
            pstm.setString(2, comentario.getComentario());
            pstm.setInt(3, comentario.getNota());
            pstm.setInt(4, comentario.getId_midia());

            pstm.setDate(5, (java.sql.Date) comentario.getDate());

            pstm.execute();
            pstm.close();

        } catch (SQLException e) {

        }
    }

    public ArrayList<Coment> vercoment(int id) throws SQLException, ClassNotFoundException {
        String sql = "select comentario.comentador,comentario.comentario,comentario.nota,comentario.data_comentario from comentario where id_filme=" + id + "";
        System.out.println("selecionando midias");
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            System.out.println("indo");
            while (rs.next()) {
                Coment objcoment = new Coment();
                objcoment.setNota(rs.getInt("nota"));
                objcoment.setComentador(rs.getString("comentador"));
                objcoment.setComentario(rs.getString("comentario"));
                objcoment.setDate(rs.getDate("data_comentario"));

                lista.add(objcoment);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(lista.size());
        return lista;

    }

    public ArrayList<Integer> vernotas(int id) throws SQLException, ClassNotFoundException {

        String sql = "select nota from comentario where id_filme=" + id + "";

        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            System.out.println("indo");
            while (rs.next()) {
                int nota = rs.getInt("nota");

                notas.add(nota);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(lista.size());

        return notas;

    }
}
