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
            Tema tema=new Tema();
            tema.setName(request.getParameter("tema_nome"));
            try{
            control.cadastrarTema(tema);
            out.print(tema.getName());
//response.sendRedirect("../editor/tema.jsp");
  
            }
            catch(Exception err){
            }
            }
            }
        %>
    </body>
</html>
