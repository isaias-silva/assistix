package br.com.DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {

    private Connection conJDBC;

    private final String URLDB = "jdbc:mysql://localhost:3306/assisflix";
    private final String usuario = "isaias";
    private final String senha = "s100";

    public Connection ConexaoDAO() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conJDBC = DriverManager.getConnection(URLDB, usuario, senha);

            System.out.println("banco conectado");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro na conexão");
        }
        return conJDBC;
    }

    }