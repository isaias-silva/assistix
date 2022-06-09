<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
       <% 
        if(session.getAttribute("admin")!=null){
          response.sendRedirect("dashboard.jsp");    
           }else{
           response.sendRedirect("./autentification/login.jsp");
           }
       %>
          
    </body>
</html>
