
<%@page import="br.com.DAO.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    
        <title>JSP Page</title>
    </head>
    <body>
        <%
         if(session.getAttribute("admin")==null){
                      response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
            
        }else{
          int id= Integer.parseInt(request.getParameter("id"));
          AdminDAO control=new AdminDAO();
          try{
            control.deleteAdmin(id);
            response.sendRedirect("../create/form_new_adm.jsp");
            }
          catch(Exception err){
            out.print("erro: "+err);
            }
            }
       
        %>
    </body>
</html>
