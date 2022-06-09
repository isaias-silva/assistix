<%@page import="br.com.DAO.AdminDAO" %>
<%@page import="br.com.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
     
        <title>JSP Page</title>
    </head>
    <body>
        <%    
                 String nick=request.getParameter("nickname");
                 String pass=request.getParameter("pass");
                Admin admin= new Admin();
                admin.setNickname(nick);
                admin.setSenha(pass);
                AdminDAO admincontrol=new AdminDAO();
             Admin logado= admincontrol.adminAuth(admin);
             if(logado==null){
            out.print("senha incorreta ou usuário inexistente");
            }else{   
             out.print("logado= "+admin.getNickname());
                session.setAttribute("admin",logado);
               response.sendRedirect("../index.jsp");
            }
              
            %>
    </body>
</html>
