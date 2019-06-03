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
    </head>
    <body>
        <h1>LOGIN</h1>
        
        <form action="../../LoginController" method="POST">
            <input type="text" name="usuario" placeholder="Usuário"/>
            <input type="password" name="senha" placeholder="Senha"/>
            
            <button type="submit">Login</button>
        </form>
        
    </body>
</html>
