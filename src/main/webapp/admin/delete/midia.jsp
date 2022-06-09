<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.model.Admin" %>
<%@page import="java.util.ArrayList"%>
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
          Admin adm=(Admin)session.getAttribute("admin");  
          int id= Integer.parseInt(request.getParameter("id"));
          MidiaDAO control=new MidiaDAO();
        boolean check=control.isCreator(adm.getId(),id);
        out.print(check);
        if(adm.getClasse().equals("master")){
        try{
            control.deleteMidia(id);
            response.sendRedirect("../index.jsp");
            }
          catch(Exception err){
            out.print("erro: "+err);
            }
                }else{
                if(check==true){
               try{
            control.deleteMidia(id);
            response.sendRedirect("../index.jsp");
            }
          catch(Exception err){
            out.print("erro: "+err);
            }   
                }else{
                
                   response.sendError(HttpServletResponse.SC_UNAUTHORIZED);  
                }
                }
            }
       
        %>
    </body>
</html>
