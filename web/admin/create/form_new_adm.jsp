<%@page import="br.com.DAO.AdminDAO" %>
<%@page import="br.com.model.Admin" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="../../css/login.css"/>
   
        <title>criar admin</title>
           <% 
       Admin adm=(Admin)session.getAttribute("admin");
       if(adm.getClasse().equals("master")==false){
       response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        
               }
               
       %>
    </head>
    <body>
        <div class="login">
            <h1>criar admin</h1>
        <form action="../create/createadmin.jsp" method="POST">
            <input type="text" name="nickname">
            <input type="password" name="pass">
            
            <select name="classe">
                <option value="master">master</option>
                <option value="basic">basic</option>

            </select>
       <input type="submit" value="criar admin" />
        </form>
    </div>
        </body>
</html>
