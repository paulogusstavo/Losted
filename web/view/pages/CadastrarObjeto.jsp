<%-- 
    Document   : CadastrarObjeto
    Created on : Jun 2, 2019, 8:53:34 PM
    Author     : paulogusstavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Objeto</title>
    </head>
    <body>
        <h1>Cadastro de Objetos</h1>
        
        <form action="" method="POST" id="cadastroObjeto">
            
            <input type="text" name="Nome" placeholder="Nome"><br>
            <input type="text" name="Cor" placeholder="Cor"><br>
            <input type="text" name="Código" placeholder="Código"><br>
            
            <select name="select">
                <option selected>Selecione uma opção</option>
                <option value="Vermelho">Vermelho</option>                 
                <option value="Azul">Azul</option>
            </select>
            <br>
            <button type="submit" form="cadastroObjeto">Cadastrar</button>
                      
        </form>
        
    </body>
</html>
