<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
