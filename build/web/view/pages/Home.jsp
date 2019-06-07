<%-- 
    Document   : Home
    Created on : Jun 3, 2019, 7:49:07 PM
    Author     : paulogusstavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retorno Rápido - Home</title>
        
        <link rel="stylesheet" type="text/css" href="view/css/cadastro-objeto.css">
    </head>
    <body>
    <center>
            <div class="direita">

                <%
                    String user = (String) request.getAttribute("nomeUsuario");
                    out.print("<span class='bem-vindo'>BEM VINDO, " + user.toUpperCase() + "</span>");
                %>

                <div class="pipe"></div>

                <span class="sair" onclick="location='index.html'" >SAIR</span>
            </div>
            <br><br><br><br>
            <div>
                <img src="view/img/logo-fundo-branco-horizontal.png" class="logo_fundo_branco_horizontal">
            </div>
            <br>
            <div>
                <button class="texto" onclick="location='view/pages/CadastrarObjeto.jsp'">Cadastrar Objeto</button>
                <br><br>

                <button class="texto" onclick="location='view/pages/DevolverObjeto.jsp'">Devolver Objeto</button>
                <br><br>
            </div>

        
    </center>
    </body>
</html>
