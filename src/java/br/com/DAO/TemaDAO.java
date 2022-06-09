package br.com.DAO;

import br.com.model.Tema;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TemaDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Tema> lista = new ArrayList();

    public void cadastrarTema(Tema tema) throws ClassNotFoundException {
        String sql = "insert into tema (tema) values (?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, tema.getName());

            pstm.execute();
            pstm.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deletarTema(int id) throws ClassNotFoundException {
        String sql = "update tema set tema_status='deleted' where id=" + id + "";
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

    public int checkNumber(int id) throws ClassNotFoundException {
        ArrayList<String> listaCount = new ArrayList();
        String sql = "select nome from midia where id_tema=" + id + "";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                String item = rs.getString("nome");
                listaCount.add(item);
            }
            pstm.close();

        } catch (SQLException err) {
            System.out.println(err);
        }

        return listaCount.size();
    }

    public ArrayList<Tema> verTema() throws ClassNotFoundException {
        String sql = "select * from tema where tema_status !='deleted'";

        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                Tema objTema = new Tema();
                objTema.setName(rs.getString("tema"));
                objTema.setId(rs.getInt("id"));

                lista.add(objTema);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println("deu ruim em temas: \n" + e);
        }

        return lista;
    }
}
