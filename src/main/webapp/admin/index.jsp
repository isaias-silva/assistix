<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
    <head>
       
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
