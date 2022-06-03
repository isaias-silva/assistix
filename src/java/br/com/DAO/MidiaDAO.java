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
    ArrayList<Midia> lista= new ArrayList();
    public void cadastrarMidia(Midia midia) throws ClassNotFoundException{
         String sql = "insert into midia (nome,director,ano,enredo,tipo,tema) values (?,?,?,?,?,?)";
        con = new ConexaoDAO().ConexaoDAO();
        try {
            
            pstm = con.prepareStatement(sql);
            pstm.setString(1,midia.getNome());
            pstm.setString(2,midia.getDirector());
           pstm.setInt(3, midia.getYear());
        pstm.setString(4,midia.getPlot());
       pstm.setString(5,midia.getType());
       pstm.setString(6,midia.getTema());    
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
        }
    }
     public ArrayList<Midia> verMidia() throws SQLException, ClassNotFoundException{
    String sql = "select * from midia join tema on midia.id_tema=tema.id and m_status !='deleted' ";
         System.out.println("selecionando midias");    
    con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
           System.out.println("indo");
            while(rs.next()){
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
             System.out.println(lista.size());
          return lista;
           
     }
 public Midia irparaMidia(String name) throws SQLException, ClassNotFoundException{
       Midia midia_item=new Midia(); 
       //impedir sql injection
     String sql = "SELECT * FROM midia JOIN tema  on id_tema=tema.id WHERE nome= '"+name+"'  and m_status !='deleted'";
         System.out.println("procurando midia");    
    con = new ConexaoDAO().ConexaoDAO();
        try {
           
            pstm = con.prepareStatement(sql);
        
            System.out.println(name);
           
            rs = pstm.executeQuery(sql);
           
            while(rs.next()){
                System.out.println();
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
 public ArrayList<Midia> midias_relacionadas(String tema) throws ClassNotFoundException{
    String sql="select * from midia join tema where tema='"+tema+"' and id_tema=tema.id and m_status !='deleted'";
      con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
           
     
            rs = pstm.executeQuery(sql);
           System.out.println("indo");
            while(rs.next()){
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
             System.out.println(lista.size());
          return lista;
    
 }
 public ArrayList<Midia> midias_do_ano() throws ClassNotFoundException{
     Calendar cal = GregorianCalendar.getInstance();

     int ano=cal.get(Calendar.YEAR);
    String sql="select * from midia where ano="+ano+"  and m_status !='deleted'";
      con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
           
     
            rs = pstm.executeQuery(sql);
           System.out.println("indo");
            while(rs.next()){
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
             System.out.println(lista.size());
          return lista;
    
 }
 public ArrayList<Midia> midias_tipo(String tipo) throws ClassNotFoundException{
 
    String sql="select * from midia where tipo='"+tipo+"'";
      con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
           
     
            rs = pstm.executeQuery(sql);
           System.out.println("indo");
            while(rs.next()){
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
             System.out.println(lista.size());
          return lista;
    
 }
 public ArrayList<Midia> midias_procurar(String palavra) throws ClassNotFoundException{
 
    String sql="select * from midia";
      con = new ConexaoDAO().ConexaoDAO();
        try {
            pstm = con.prepareStatement(sql);
           
     
            rs = pstm.executeQuery(sql);
           System.out.println("indo");
            while(rs.next()){
                
                Midia objMidia = new Midia();
                objMidia.setId(rs.getInt("id"));    
                objMidia.setNome(rs.getString("nome"));
                objMidia.setDirector(rs.getString("diretor"));
                objMidia.setPlot(rs.getString("enredo"));
                objMidia.setYear(rs.getInt("ano"));
                objMidia.setType(rs.getString("tipo"));
               objMidia.setUrl_img(rs.getString("capa"));
               objMidia.setFaixa_etaria(rs.getInt("faixa_etaria"));
              if(objMidia.getNome().contains(palavra)){
              lista.add(objMidia);
              }
               
               
            
            }
            pstm.close();
             } catch (SQLException e) {
                System.out.println(e);
             } 
          
    return lista;
 }
 
}