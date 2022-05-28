<%-- 
 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.DAO.midiaDAO" %>
<%@page import="br.com.DAO.temaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Assistix - guia de midia</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css"/>
   
    </head>
    <body>
        <header>
            <h1>Assistix</h1>
            <form class="busca" method="POST" action="./search.jsp">
                <input type="search" placeholder="pesquisar" id="sch">
  
            <button value="submit"></button>
            </form>
            </header>
       
        <section>
           
            <div class="capa">
               </div>
              <div class="capa-help"></div>
           
            <aside>
             
               <input type="checkbox" id="check" class="checkmenu" onchange="menu()">
               <label for="check" class="menu" >
                   <span></span>
                   <span></span>
                   <span></span>
               </label>
               <div id="list" class="esconder">
              <ul>
                  <li><a href="/" target="_blank">lançamentos do ano</a></li>
                    <li><a href="/" target>séries</a></li>
                    <li><a href="/" target="_blank">filmes</a></li>
               </ul>
              <ul>
                 <%
                 temaDAO tema= new temaDAO();
                 ArrayList<Tema> temas= tema.verTema();
                 for(int n=0;n< temas.size();n++){
                     out.print("<li>"+"<a href='"+"/tema/"+temas.get(n).getName()+"' target='_blank'>"+temas.get(n).getName()+"</a></li> ");
                     
                     }
                 %>
             
              </ul>
               </div>
               
            </aside> 
          <div class="items">
              <a href="google.com"> 
              <div class="film-content">
                  <img src="https://m.media-amazon.com/images/M/MV5BMjQzNjA3NGQtMzRiNi00OGIyLWJiZjYtZWZmNTJhNDE5YzI5L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg" >
                    </div>
             <p>berserk</p>     
              </a>
              
              <%
                  
                  try{
               midiaDAO midia=new midiaDAO();
               ArrayList<Midia> list = midia.verMidia();
              for(int num=0;num<list.size();num++){
                  out.print("<a href='./midias/mid.jsp?name="+list.get(num).getName()+"&mask_id="+list.get(num).getId()+"''/>"
                  + "<div class='film-content'>"
                  + "<img src='"+list.get(num).getUrl_img()+"'>"
                  + "</div>"
                  + "<p>"+list.get(num).getName()+"</p>"
                  
                  + ""+"</a>");
                  }
    }catch(Exception e){
    out.print("erro" + e);
    }             
%>
          
          </div>
        </section>
        <footer>
            <p>2022 &copy;</p>
        </footer>
        <<script src="./js/script.js"></script>
    </body>
</html>

