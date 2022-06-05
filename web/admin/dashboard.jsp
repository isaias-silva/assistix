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
         
       
       %>
    </head>
    <body>
        <header>
        <h1>painel de controle</h1>
        </header>
        <section>
            <aside>
                <<ul>
                    <li><a href="editor">criar temas</a></li>
                    <%
                    if(adm!=null){
                    if(adm.getClasse().equals("master")){
                       out.print("<li><a href='create/form_new_adm.jsp'>admins</a></li>");
                        }}else{
                          response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
                        }
                    %>
              
                    <li><a href="editor">comentários</a></li>
                 
                </ul>
                <div class="info">
                    <p><b>admin:</b> <% if(adm!=null){out.print(adm.getNickname());} %></p>
                     <p><b>classe:</b> <%if(adm!=null){out.print(adm.getClasse());} %></p>
                     <p><a href="./exit.jsp">sair</a></p>
                </div>
            </aside>
        </section>
        <footer>
            
        </footer>
        
    </body>
</html>
