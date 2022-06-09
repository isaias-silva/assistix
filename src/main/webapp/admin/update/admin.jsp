<%@page import="br.com.DAO.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
         if(session.getAttribute("admin")==null){
                      response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
            
        }else{
             int id= Integer.parseInt(request.getParameter("id"));
            String action=request.getParameter("update");
             AdminDAO control=new AdminDAO();
          try{
            control.updateAdmin(id,action);
            response.sendRedirect("../create/form_new_adm.jsp");
            }
          catch(Exception err){
            out.print("erro: "+err);
            }

      
                }
       
        %>
    </body>
</html>
