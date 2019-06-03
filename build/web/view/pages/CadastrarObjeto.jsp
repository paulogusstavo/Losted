<%-- 
    Document   : CadastrarObjeto
    Created on : Jun 2, 2019, 8:53:34 PM
    Author     : paulogusstavo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ObjetoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Objeto</title>
    </head>
    <body>
        <h1>Cadastro de Objetos</h1>
        
        <form action="../../ObjetoController" method="POST" id="cadastroObjeto">
            
            <input type="text" name="nome" placeholder="Nome"><br>
            <input type="text" name="cor" placeholder="Cor"><br>
            <input type="text" name="codigo" placeholder="Código"><br>
            
            <select name="localizacao">
                <option selected>Selecione uma opção</option>
            <%
                ObjetoDAO dao = new ObjetoDAO();
                ResultSet rs = dao.getLocalizacao();
                try {
                    while (rs.next()) {
                        String opcao = "<option value='" + 
                                rs.getString("id") + "'>" + 
                                "Bloco " + rs.getString("numero_bloco") +
                                " (" + rs.getString("cor_bloco") + ")</option>"; 
                        out.print(opcao);
                    }
                } 
                 catch (SQLException ex) { }
            %>
            </select>
            
            <br>
            
            <button type="submit" form="cadastroObjeto">Cadastrar</button>
                      
        </form>
        
    </body>
</html>
