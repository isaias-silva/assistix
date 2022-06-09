package br.com.DAO;

import br.com.model.Midia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class MidiaDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Midia> lista = new ArrayList();

    public void cadastrarMidia(Midia midia) throws ClassNotFoundException {
        String sql = "insert into midia (nome,diretor,ano,enredo,tipo,id_tema,capa,wallpaper,faixa_etaria,id_admin) values (?,?,?,?,?,?,?,?,?,?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {

            pstm = con.prepareStatement(sql);
            pstm.setString(1, midia.getNome());
            pstm.setString(2, midia.getDirector());
            pstm.setInt(3, midia.getYear());
            pstm.setString(4, midia.getPlot());
            pstm.setString(5, midia.getType());
            pstm.setInt(6, midia.getId_tema());
            pstm.setString(7, midia.getUrl_img());
            pstm.setString(8, midia.getWallpaper());
            pstm.setInt(9, midia.getFaixa_etaria());
            pstm.setInt(10, midia.getId_admin());
            pstm.execute();
            pstm.close();

        } catch (SQLException e) {
            System.out.println("erro: " + e);
        }
    }

    public void deleteMidia(int id) throws ClassNotFoundException {
        String sql = "update midia set m_status='deleted' where id=" + id + "";
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

    public ArrayList<Midia> verMidia() throws SQLException, ClassNotFoundException {
        String sql = "select * from midia join tema on midia.id_tema=tema.id and m_status !='deleted' ";

        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setTema(rs.getString("tema"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
                lista.add(objMidia);

            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;

    }

    public Midia irparaMidia(String name) throws SQLException, ClassNotFoundException {
        Midia midia_item = new Midia();
        //impedir sql injection
        String sql = "SELECT * FROM midia JOIN tema  on id_tema=tema.id WHERE nome= '" + name + "'  and m_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                midia_item.setNome(rs.getString("nome"));
                midia_item.setDirector(rs.getString("diretor"));
                midia_item.setPlot(rs.getString("enredo"));
                midia_item.setTema(rs.getString("tema"));
                midia_item.setYear(rs.getInt("ano"));
                midia_item.setType(rs.getString("tipo"));
                midia_item.setUrl_img(rs.getString("capa"));
                midia_item.setFaixa_etaria(rs.getInt("faixa_etaria"));
                midia_item.setWallpaper(rs.getString("wallpaper"));
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return midia_item;
    }

    public ArrayList<Midia> midias_relacionadas(String tema) throws ClassNotFoundException {
        String sql = "select * from midia join tema where tema='" + tema + "' and id_tema=tema.id and m_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setTema(rs.getString("tema"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
                lista.add(objMidia);
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

    public ArrayList<Midia> midiaAdmin(int id) throws ClassNotFoundException {
        String sql = "select * from midia join tema where id_admin=" + id + " and midia.id_tema=tema.id and m_status!='deleted';";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setTema(rs.getString("tema"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
                lista.add(objMidia);
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

    public ArrayList<Midia> midias_do_ano() throws ClassNotFoundException {
        Calendar cal = GregorianCalendar.getInstance();
        int ano = cal.get(Calendar.YEAR);
        String sql = "select * from midia where ano=" + ano + "  and m_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
                lista.add(objMidia);
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

    public ArrayList<Midia> midias_tipo(String tipo) throws ClassNotFoundException {
        String sql = "select * from midia where tipo='" + tipo + "' and m_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                lista.add(objMidia);
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

    public ArrayList<Midia> midias_procurar(String palavra) throws ClassNotFoundException {
        String sql = "select * from midia where m_status!='deleted' ";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while (rs.next()) {
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
                objMidia.setUrl_img(rs.getString("capa"));
                objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
                if (objMidia.getNome().contains(palavra)) {
                    lista.add(objMidia);
                }
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    public boolean isCreator(int id_adm, int id_midia) throws ClassNotFoundException {
        String sql = "select midia.nome, admins.nickname from midia join admins where admins.id=" + id_adm + " and midia.id=" + id_midia + " and midia.id_admin=" + id_adm + "";
        con = new ConexaoDAO().ConexaoDAO();
        boolean response = false;
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                if (rs.getString("nickname") != null) {
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
