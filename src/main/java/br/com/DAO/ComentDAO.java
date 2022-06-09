package br.com.DAO;

import br.com.model.Coment;
import java.sql.Connection;
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

    public void deletarComent(int id) throws ClassNotFoundException {
        String sql = "update comentario set comentario_status='deleted' where id=" + id + "";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            pstm.execute();
            pstm.close();
            System.out.println("deletado");
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    public ArrayList<Coment> vercoment(int id) throws SQLException, ClassNotFoundException {
        String sql = "select comentario.comentador,comentario.comentario,comentario.nota,comentario.data_comentario,comentario.id from comentario where id_filme=" + id + " and comentario_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                Coment objcoment = new Coment();
                objcoment.setNota(rs.getInt("nota"));
                objcoment.setId(rs.getInt("id"));
                objcoment.setComentador(rs.getString("comentador"));
                objcoment.setComentario(rs.getString("comentario"));
                objcoment.setDate(rs.getDate("data_comentario"));

                lista.add(objcoment);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;

    }

    public ArrayList<Integer> vernotas(int id) throws SQLException, ClassNotFoundException {

        String sql = "select nota from comentario where id_filme=" + id + " and comentario_status !='deleted'";

        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                int nota = rs.getInt("nota");

                notas.add(nota);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return notas;

    }

    public boolean isCreator(int id_adm, int id_coment) throws ClassNotFoundException {
        String sql = "select midia.nome, admins.nickname,comentario.comentario from midia join admins join comentario where admins.id=" + id_adm + " and comentario.id=" + id_coment + " and midia.id_admin=" + id_adm + " and comentario.id_filme=midia.id";
        con = new ConexaoDAO().ConexaoDAO();
        boolean response = false;
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                if (rs.getString("nickname") != null) {
                    System.out.println("ele é autor ");
                    System.out.println(rs.getString("nickname") + " " + rs.getString("nome"));
                    response = true;
                }

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return response;
    }
}
