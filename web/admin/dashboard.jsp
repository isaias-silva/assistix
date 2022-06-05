<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.AdminDAO" %>
<%@page import="br.com.model.Admin" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style.css"/>
        <title>painel de controle- Assistix;</title>
           <% 
  Admin adm=(Admin)session.getAttribute("admin");  
 if(adm==null){
       response.sendError(HttpServletResponse.SC_UNAUTHORIZED);       
       }
       %>
    </head>
    <body>
        <header>
        <h1>painel de controle</h1>
        </header>
        <section>
            <aside>
                <<ul>
                    <li><a href="editor">temas</a></li>
                    <li><a href="editor">admins</a></li>
                    <li><a href="editor">comentários</a></li>
                 
                </ul>
                <div class="info">
                    <p><b>admin:</b> <%=adm.getNickname()%></p>
                     <p><b>classe:</b> <%=adm.getClasse()%></p>
                </div>
            </aside>
        </section>
        <footer>
            
        </footer>
        
    </body>
</html>
