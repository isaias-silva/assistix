<%@page import="br.com.DAO.MidiaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          MidiaDAO control=new MidiaDAO();
          try{
            control.deleteMidia(id);
            response.sendRedirect("../index.jsp");
            }
          catch(Exception err){
            out.print("erro: "+err);
            }
            }
       
        %>
    </body>
</html>
