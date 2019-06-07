package DAO;

import com.mysql.jdbc.Connection;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
        
    private final static String usuario = "root";
    private final static String senha = "root";
    private final static String driver = "com.mysql.jdbc.Driver";
    // *** VERIFICAR PORTA DO MYSQL ABAIXO ***
    private final static String banco = "jdbc:mysql://127.0.0.1:8889/RETORNO_RAPIDO";
    private Connection conn;
    
    public Conexao(){
        try {
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(banco, usuario, senha);
        }
        catch(SQLException | ClassNotFoundException ex ) {
            out.print(ex.getMessage());
        }
    }
    
    public Connection getConnection(){
        return this.conn;
    }
}