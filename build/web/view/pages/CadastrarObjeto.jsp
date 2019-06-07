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
        <title>Retorno Rápido - Cadastro</title>
        <link rel="stylesheet" type="text/css" href="../css/cadastro-objeto.css">
    </head>
    <body>
    <center>
        <form action="../../ObjetoController" method="POST" id="cadastroObjeto">
        <div class="direita">
            <span class="bem-vindo">BEM VINDO, ADMIN</span> 

            <div class="pipe"></div>

            <span class="sair" onclick="location='../../index.html'" >SAIR</span>
        </div>
        <br><br><br><br>
        <div>
            <img src="../img/logo-fundo-branco-horizontal.png" class="logo_fundo_branco_horizontal">
        </div>

        <br>

        <div>
            <input class="texto input" type="text" name="nome" placeholder="Nome"><br><br>
            <input class="texto input" type="text" name="cor" placeholder="Cor"><br><br>
            <input class="texto input" type="text" name="codigo" placeholder="Código"><br><br>
            
            <select class="texto input" name="localizacao">
                <option value="" disabled selected>Localização</option>
                <%
                    ObjetoDAO dao = new ObjetoDAO();
                    ResultSet rs = dao.getLocalizacao();
                    try {
                        while (rs.next()) {
                            String opcao = "<option value='"
                                    + rs.getString("id") + "'>"
                                    + "Bloco " + rs.getString("numero_bloco")
                                    + " (" + rs.getString("cor_bloco") + ")</option>";
                            out.print(opcao);
                        }
                    } catch (SQLException ex) {
                    }
                %>
            </select>

            <br><br><br>
            <button form="cadastroObjeto" type="submit" class="texto">Cadastrar novo objeto</button>
        </div>

        </form>
    </center>
    
       
    </body>
</html>