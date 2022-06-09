<%@page import="br.com.DAO.ComentDAO" %>
<%@page import="br.com.model.Coment" %>
<%@page import="br.com.model.Admin" %>
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
        ComentDAO control=new ComentDAO();
         int id=Integer.parseInt(request.getParameter("id"));
         Admin adm=(Admin)session.getAttribute("admin");  
      
     try{
        if(adm.getClasse().equals("master")){
            control.deletarComent(id);
             response.sendRedirect("../editor/comentarios.jsp");
         }else{
              boolean check=control.isCreator(adm.getId(),id);
             if(check==true){
                control.deletarComent(id);
                response.sendRedirect("../editor/comentarios.jsp");
                }else{
             response.sendError(HttpServletResponse.SC_UNAUTHORIZED);  
            }
            }}  catch(Exception err){
            out.print(err);
            }
            }
        %>
    </body>
</html>
