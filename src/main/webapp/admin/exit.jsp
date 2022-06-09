<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>exit</title>
    </head>
    <body>
        <%
          session.setAttribute("admin",null);
            response.sendRedirect("./index.jsp");
        %>
    </body>
</html>
