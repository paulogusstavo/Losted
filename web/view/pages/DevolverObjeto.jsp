<%-- 
    Document   : DevolverObjeto
    Created on : Jun 4, 2019, 11:57:53 AM
    Author     : paulogusstavo
--%>

<%@page import="java.sql.Struct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retorno Rápido - Devolução</title>
        
        <link rel="stylesheet" type="text/css" href="../css/cadastro-objeto.css">
    </head>
    <body>
    <center>
        <form action="../../ObjetoController" method="POST">
            
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
                
                <input class="texto input" type="text" name="codigoDevolucao" placeholder="Codigo"/>
                <br><br>
                <input class="texto input" type="text" name="pessoa" placeholder="Aluno que encontrou"/>
                <br><br>
                <textarea class="texto obs" name="observacao" rows="5" placeholder="Observação"></textarea>

                <br><br><br>
                <button form="cadastroObjeto" type="submit" class="texto">Devolver</button>
            </div>

        </center>

        </form>
        
    </body>
</html>