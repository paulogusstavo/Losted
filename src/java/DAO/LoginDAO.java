/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;

/**
 *
 * @author paulogusstavo
 */
public class LoginDAO {
    
    private String usuario;
    private String senha;
    private Conexao conn;
    private ResultSet resultado;
    
    public LoginDAO() {
        this.conn = new Conexao();
    }
    
    public String verificarCredenciais (Usuario u) {
        
        String strProcedure = "{call login(?,?,?)}";
        CallableStatement cs;
        try {
            cs = conn.getConnection().prepareCall(strProcedure);
            cs.setString(1, u.getLogin());
            cs.setString(2, u.getSenha()); 
            cs.registerOutParameter(3,java.sql.Types.VARCHAR);
            cs.execute();
            String strName=cs.getString(3);
            return strName;
        } 
        catch (SQLException ex) { }
        return null;
    }
   
}
