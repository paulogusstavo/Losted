package controller;

import DAO.LoginDAO;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author paulogusstavo
 */
public class LoginController extends HttpServlet {
    
    LoginDAO loginDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       String user = request.getParameter("usuario");
       String pass = request.getParameter("senha");
       
       Usuario u = new Usuario(user, pass);
       
       loginDAO = new LoginDAO();
       String result = loginDAO.verificarCredenciais(u);
       
       if (result.equals("Login efetuado com sucesso!")) {
           request.setAttribute("nomeUsuario", user);
           request.getRequestDispatcher("view/pages/Home.jsp").forward(request, response);
       }
       else {
//           out.print("TESTE");
       }
    
        
        
    }
}