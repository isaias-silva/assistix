package br.com.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConexaoDAO {
    private Connection conJDBC;
    public Connection ConexaoDAO() throws ClassNotFoundException {
         String server = "anhanguera.cmi4gdq4rsw6.sa-east-1.rds.amazonaws.com";
        String banco = "assisflix";
        String user = "admin";
        String pass = "adminadmin";       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://"+server+":3306/"+banco+"?user="+user+"&password="+pass+"";            
            conJDBC = DriverManager.getConnection(url);                      
        } catch (SQLException e) {
            System.out.println("ERRO NA CONEXÃO: "+ e);
        }
        return conJDBC;  
    }
    }