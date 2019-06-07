package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Devolucao;
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
                    + "WHERE status_FK = 1 AND nome LIKE '%" + pesquisa + "%'";
            
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
            query = "INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES "
                    + "(\""+ op.getNome() + "\", \"" + op.getCor() + "\", \"" + op.getCodigo() + "\", "
                    + op.getLocalizacao().getId() + ")";
                   
            statement = conn.getConnection().prepareStatement(query);
            statement.executeUpdate();          
        }
        catch(SQLException ex) { }
    }
    
    public void devolverObjeto(Devolucao d) {
        try{
            query = "INSERT INTO Devolucao (pessoa, objeto_FK, observacao) VALUES"
                    + " (\"" + d.getPessoa() + "\", \"" + d.getCodigoObjeto() + "\", \""
                    + d.getObservacao() + "\")";
                   
            statement = conn.getConnection().prepareStatement(query);
            statement.executeUpdate();          
        }
        catch(SQLException ex) { }
    }
    
}
