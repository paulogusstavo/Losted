package controller;

import DAO.ObjetoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Localizacao;
import model.ObjetoPerdido;
/**
 * @author paulogusstavo
 */
public class ObjetoController extends HttpServlet {
    
    private ResultSet rs;
    private ObjetoDAO objDAO;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            //Pesquisa de Objeto via GET.
        
//        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        String paramValue = request.getParameter("pesquisa");
//        out.write(paramValue);
//        out.close();        
        
        objDAO = new ObjetoDAO();
        rs = objDAO.listarPendentes(paramValue);
        
        ArrayList<ObjetoPerdido> listaObjetos = new ArrayList<>();
     
        try {
            while (rs.next()) {
                listaObjetos.add(new ObjetoPerdido(
                      rs.getString("nome"),
                      rs.getString("cor"),
                      rs.getString("codigo"),
                      new Localizacao(
                              rs.getString("cor_bloco"), 
                              rs.getString("numero_bloco")
                      ),
                      rs.getString("data_cadastrado")
                ));                                
            }   
            
         request.setAttribute("objetos", listaObjetos);
         request.getRequestDispatcher("view/pages/ListarObjeto.jsp").forward(request, response);
         
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            //Cadastro de Objeto via POST.
        
        objDAO = new ObjetoDAO();
        ObjetoPerdido objPerdido = new ObjetoPerdido();
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        
        String nome = request.getParameter("nome");
        objPerdido.setNome(nome);
        
        String cor = request.getParameter("cor");
        objPerdido.setCor(cor);
        
        String codigo = request.getParameter("codigo");
        objPerdido.setCodigo(codigo);
       
        int idLocalizacao = Integer.parseInt(request.getParameter("localizacao"));
        objPerdido.setLocalizacao(new Localizacao(idLocalizacao));
      
        objDAO.inserir(objPerdido);
        
        
    }

}
