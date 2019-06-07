<%-- 
    Document   : Login
    Created on : Jun 3, 2019, 6:08:36 PM
    Author     : paulogusstavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOSTED - Login</title>
        <link href="../css/index.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <form action="../../LoginController" method="POST">
            
            <div>
                <center>
                    <img src="../img/logo-fundo-roxo.png" class="logo_fundo_roxo_login">
                </center>

                <center>
                    <input class="campo-de-login texto" type="text" name="usuario" placeholder="Usuário"/></input>
                    <br>
                    <input type="password" name="senha" class="campo-de-login texto" placeholder="Senha"></input>
                    <br><br>
                    <button type="submit" class="botao-entrar">
                        <span class="texto">Entrar</span>
                    </button>

                </center>
            </div>
        </form>
        
    </body>
</html>
