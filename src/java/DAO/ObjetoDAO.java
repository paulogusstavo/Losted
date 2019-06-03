package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ObjetoPerdido;

/*
 * @author paulogusstavo
 */
public class ObjetoDAO {
    
    //private ObjetoPerdido objeto;
    private String query;
    private PreparedStatement statement;
    private Conexao conn;
    private ResultSet resultado;
    
    public ObjetoDAO() {
        this.conn = new Conexao();
    }
    
    public ResultSet listarPendentes(String pesquisa){
        try{
            query = "SELECT nome, cor, codigo, data_cadastrado, cor_bloco, numero_bloco FROM Objeto O "
                    + "INNER JOIN Localizacao L ON O.localizacao_FK = L.id "
                    + "WHERE encontrado = false AND nome LIKE '%" + pesquisa + "%'";
            
            statement = conn.getConnection().prepareStatement(query);
            resultado = statement.executeQuery();
            
            return resultado;
        }
        catch(SQLException ex) { return resultado; }
    }
    
    public ResultSet getLocalizacao(){
        try{
            query = "SELECT * FROM Localizacao ORDER BY numero_bloco ASC";
            
            statement = conn.getConnection().prepareStatement(query);
            resultado = statement.executeQuery();
            
            return resultado;
        }
        catch(SQLException ex) { return resultado; }
    }
   
    public void inserir(ObjetoPerdido op) {
        try{
            // Consulta aninhada para receber o id_FK da localizacao.
//            query = "INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES "
//                    + "(\""+ op.getNome() + "\", \"" + op.getCor() + "\", \"" + op.getCodigo() + "\", "
//                    + "(SELECT id FROM Localizacao L WHERE L.cor_bloco = \"" + op.getLocalizacao().getCorBloco() + "\""
//                    + "AND L.numero_bloco=" + op.getLocalizacao().getNumBloco() + "))";

            query = "INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES "
                    + "(\""+ op.getNome() + "\", \"" + op.getCor() + "\", \"" + op.getCodigo() + "\", "
                    + op.getLocalizacao().getId() + ")";
                   
            statement = conn.getConnection().prepareStatement(query);
            statement.executeUpdate();          
        }
        catch(SQLException ex) { }
    }
    
}