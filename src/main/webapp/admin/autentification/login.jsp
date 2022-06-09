<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
       
        <link rel="stylesheet" href="../../css/login.css"/>
        <title>entrar</title>
    </head>
    <body>
        <div class="login">
        <h1>entre</h1>
        <form action="./authentific.jsp" method="POST">
            <input type="text" name="nickname" required>
            <input type="password" name="pass" required>
            <input type="submit" value="entrar" />
            
        </form>
    </div>
        </body>
</html>
