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
        <title>Losted - Home</title>
    </head>
    <body>
        <%
            String user = (String)request.getAttribute("nomeUsuario");        
            out.print("<h1>Bem Vindo, " + user + "</h1>");
        %>
        
        <a href="view/pages/CadastrarObjeto.jsp">
            <button>Cadastrar Objeto</button>
        </a>
        <br><br>
        

    </body>
</html>
