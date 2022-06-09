<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Tema" %>
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
          Admin adm=(Admin)session.getAttribute("admin");
          if(adm!=null){
       if(adm.getClasse().equals("master")==false){
       response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        
               }else{
            TemaDAO control=new TemaDAO();
            Tema tema=new Tema();
            tema.setName(request.getParameter("tema_nome"));
            try{
            control.cadastrarTema(tema);
               response.sendRedirect("../editor/tema.jsp");
  
            }
            catch(Exception err){
            }
            }
            }
        %>
    </body>
</html>
