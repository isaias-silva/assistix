<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.AdminDAO" %>
<%@page import="br.com.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilo.css"/>
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
                <ul style="margin-top: 40px;">
                   <li><a href="editor?method=create">criar midia</a></li>
                 
                
                    <%
                    if(adm!=null){
                    if(adm.getClasse().equals("master")){
                       out.print("<li><a href='create/form_new_adm.jsp'>admins</a></li>");
                       out.print("<li><a href='editor/tema.jsp'>criar temas</a></li>");
                           }}else{
                          response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
                        }
                    %>
              
                    <li><a href="editor/comentarios.jsp">comentários</a></li>
                 
                </ul>
                <div class="info">
                    <p><b>admin:</b> <% if(adm!=null){out.print(adm.getNickname());} %></p>
                     <p><b>classe:</b> <%if(adm!=null){out.print(adm.getClasse());} %></p>
                     <p><a href="./exit.jsp">sair</a></p>
                </div>
            </aside>
                           
                               <div class="items">
                       
              <%
                  
                  try{
               MidiaDAO midia=new MidiaDAO();
               ArrayList<Midia> list;
                 if(adm.getClasse().equals("master")){
               list= midia.verMidia();
                  }else{
                        list= midia.midiaAdmin(adm.getId());
                  }
              for(int num=0;num<list.size();num++){
                  out.print(
                
                  "<div class='film-additional'>"
                    + "<a href='../midias?name="+list.get(num).getNome()+"&mask_id="+list.get(num).getId()+"'' target='_blank'>"
            
                  +"<div class='film-content'>"
                      
                  + "<img src='"+list.get(num).getUrl_img()+"'>"
         
                  + "</div>"
                  + "</a>"
                  + "<a href='./delete/midia.jsp?id="+list.get(num).getId()+"'>deletar</a>"
                  + "</div>");
                  }
    }catch(Exception e){
    out.print("erro" + e);
    }             
%>
          
          </div>
        </section>
        <footer>
            
        </footer>
        
    </body>
</html>
