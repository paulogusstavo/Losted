<%-- 
    Document   : ListarObjeto
    Created on : Jun 2, 2019, 9:55:05 PM
    Author     : paulogusstavo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.ObjetoPerdido"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Objetos Perdidos</title>
    </head>
    <body>
        <h1>Lista de Objetos Perdidos</h1>
        
        <%
             ArrayList<ObjetoPerdido> myPizza = (ArrayList<ObjetoPerdido>)request.getAttribute("objetos");
      
            for (int i=0; i<myPizza.size(); i++) {
                out.print(myPizza.get(i).getNome() + "<br>");
                out.print(myPizza.get(i).getCor()+ "<br>");
                out.print(myPizza.get(i).getCodigo() + "<br>");
                out.print(myPizza.get(i).getLocalizacao().getCorBloco() + "<br>");
                out.print(myPizza.get(i).getLocalizacao().getNumBloco() + "<br>");
            }
        
        %>
        
    </body>
</html>
