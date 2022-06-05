package br.com.DAO;

import br.com.model.Admin;
import br.com.util.Hash;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDAO {

    Hash cripto = new Hash();
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Admin> lista=new ArrayList();
    public void createAdmin(Admin admin) throws ClassNotFoundException, NoSuchAlgorithmException, UnsupportedEncodingException {
        String sql = "insert into admins (nickname,senha,admin_class) values (?,?,?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {

            pstm = con.prepareStatement(sql);
            pstm.setString(1, admin.getNickname());
            pstm.setString(2, cripto.hash(admin.getSenha()));
            pstm.setString(3, admin.getClasse());
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.out.println("erro " + e);
        }
    }

    public Admin adminAuth(Admin admin) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException, UnsupportedEncodingException {
        String sql = "select * from admins where nickname='" + admin.getNickname() + "' and admin_status !='deleted'";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
                String passForm = cripto.hash(admin.getSenha());
                String passDb = rs.getString("senha");

                System.out.println(admin.getNickname() + "=" + passForm);
                System.out.println(rs.getString("nickname") + "=" + passDb);
                if (passDb.equals(passForm)) {
                    Admin admLogado = new Admin();
                    admLogado.setId(rs.getInt("id"));
                    admLogado.setNickname(rs.getString("nickname"));
                    admLogado.setClasse(rs.getString("admin_class"));
                    pstm.close();
                    return admLogado;
                }
                
            }
        } catch (SQLException err) {
            System.out.println(err);
        }

        return null;
    }
    public ArrayList<Admin> verAdmins() throws ClassNotFoundException{
        String sql = "select * from admins where admin_status!='deleted' ";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);

            while (rs.next()) {
              Admin admreturn= new Admin();
                admreturn.setId(rs.getInt("id"));
                  admreturn.setNickname(rs.getString("nickname"));
                  admreturn.setClasse(rs.getString("admin_class"));
               lista.add(admreturn);
            }
            pstm.close();
        } catch (SQLException err) {
            System.out.println(err);
        }

        return lista;
    
    }
}
