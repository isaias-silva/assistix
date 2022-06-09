<%@page import="br.com.DAO.AdminDAO" %>
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
          
  if(adm!=null && adm.getClasse().equals("master")){
                 String nick=request.getParameter("nickname");
                 String pass=request.getParameter("pass");
                  String classe=request.getParameter("classe");
                Admin admin= new Admin();
            
                if(nick!=null && pass!=null && classe!=null){
                admin.setNickname(nick);
                admin.setSenha(pass);
                admin.setClasse(classe);
                AdminDAO admincontrol=new AdminDAO();
                admincontrol.createAdmin(admin);
                response.sendRedirect("./form_new_adm.jsp");
            }else{
            
         
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        
            }
           
         }
              
            %>
    </body>
</html>
