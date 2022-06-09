<%-- 
    Document   : exit
    Created on : 5 de jun de 2022, 09:49:50
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>exit</title>
    </head>
    <body>
        <%
          session.setAttribute("admin",null);
            response.sendRedirect("./index.jsp");
        %>
    </body>
</html>
