
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
    ArrayList<Tema> lista= new ArrayList();
    public void cadastrarTema(Tema tema) throws ClassNotFoundException{
      String sql = "insert into tema (nome) values (?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1,tema.getName());
          
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
        }
    }
    public ArrayList<Tema> verTema() throws ClassNotFoundException{
     String sql = "select * from tema";
          
    con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            System.out.println("indo temas");
            while(rs.next()){
               Tema objTema = new Tema();
               objTema.setName(rs.getString("tema"));
                lista.add(objTema);
            
            }
            pstm.close();
             } catch (SQLException e) {
            System.out.println("deu ruim em temas: \n"+e);
             } 
        
        
        return lista;
    }
}
