<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Tema" %>
<%@page import="br.com.model.Admin" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
     
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Admin adm=(Admin)session.getAttribute("admin");
          if(adm!=null){
       if(adm.getClasse().equals("master")==false){
       response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        
               }else{
            TemaDAO control=new TemaDAO();
      int id= Integer.parseInt(request.getParameter("id"));
            try{
            int filmesnumb=control.checkNumber(id);
            if(filmesnumb==0){
            control.deletarTema(id);
               response.sendRedirect("../editor/tema.jsp");
  
            }else{
            
            out.print("n�o � poss�vel deletar temas com filmes registrados, apague os filmes do tema que deseja excluir antes! "+filmesnumb);
            }
            
            }
            catch(Exception err){
            }
            }
            }
        %>
            </body>
</html>