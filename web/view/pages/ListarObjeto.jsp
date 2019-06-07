<%-- 
    Document   : ListarObjeto
    Created on : Jun 2, 2019, 9:55:05 PM
    Author     : paulogusstavo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ObjetoPerdido"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Objetos Perdidos</title>
        
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="view/js/script.js"></script>
        
        <link rel="stylesheet" type="text/css" href="view/css/cadastro-objeto.css">
        <link rel="stylesheet" type="text/css" href="view/css/listar.css">
    </head>
    <body>
    <center>
        <div>
            <img src="view/img/logo-fundo-branco-horizontal.png" class="logo_fundo_branco_horizontal">
        </div>

        <br>
        
        <div>
            <%
                String valor = request.getParameter("pesquisa");
                String valor_input = "";
                if (!valor.isEmpty() || valor != null) {
                    valor_input = "value='" + valor + "' " ;
                }
                out.print("<input " + valor_input +" type='text' id='search' "
                        + "class='campo-de-busca texto' placeholder='Faça sua busca aqui'></input>");
            %>
            <img src="view/img/search-icon.png" class="search_icon">
        </div>
            </center>
        <br><br>
        

        <div style="margin-left: 20%">
            
            <%
                ArrayList<ObjetoPerdido> objetosPerdidos = (ArrayList<ObjetoPerdido>) request.getAttribute("objetos");

                for (int i = 0; i < objetosPerdidos.size(); i++) {
                    out.print("<table>");
                    out.print("<col width='300'>");
                        out.print("<tr>");
                            out.print("<th>");
                                out.print("<span class='nome'>" + objetosPerdidos.get(i).getNome() + "</span><br>");
                            out.print("</th>");
                        out.print("<tr>");
                        out.print("<tr>");
                            out.print("<td>");
                    out.print("<span class='cor'><b>Cor:</b> " + objetosPerdidos.get(i).getCor() + "</span><br>");
                            out.print("</td>");
                            out.print("<td>");
                    out.print("<span class='codigo'><b>Código:</b> " + objetosPerdidos.get(i).getCodigo() + "<br>");
                            out.print("</td>");
                        out.print("</tr>");
                        out.print("<tr>");
                            out.print("<td>");
                    out.print("<span class='cor_bloco'><b>Bloco: </b>" + objetosPerdidos.get(i).getLocalizacao().getCorBloco());
                    out.print("<span class='num_bloco'> - " + objetosPerdidos.get(i).getLocalizacao().getNumBloco() + "<br>");
                            out.print("</td>");
                            out.print("<td>");
                            
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date date = (Date)formatter.parse(objetosPerdidos.get(i).getDataCadastrado());
                    SimpleDateFormat formato= new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    String data_convertida = formato.format(date);
                            
                    out.print("<span class='data'><b>Cadastrado:</b> " + data_convertida + "<br>");
                            out.print("</td>");
                        out.print("</tr>");
                    out.print("</table>");
                        out.print("<hr/>");
                    
                }
            %>

        </div>

  
    
    </body>
</html>
