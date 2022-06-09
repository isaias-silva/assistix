<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page import="br.com.util.Altercapa" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Assistix - guia de midia</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/estilo.css"/>
   
    </head>
    <body>
        <header>
              <h1><a href="./">Assistix</a></h1>
            <form class="busca" method="GET" action="./midias/pesquisar.jsp">
                <input type="search" placeholder="pesquisar" id="sch" name="search">
  
            </form>
            </header>
       
        <section>
           
            <div class="capa" style="background-image: url(<%= new Altercapa().capareturn()%>)">
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
                  <li><a href="./midias/midiatype.jsp?go=year" target="_blank">lançamentos do ano</a></li>
                    <li><a href="./midias/midiatype.jsp?go=type&categoria=serie" target="_blank">séries</a></li>
                    <li><a href="./midias/midiatype.jsp?go=type&categoria=filme" target="_blank">filmes</a></li>
               </ul>
              <ul>
                 <%
                     try{
                 TemaDAO tema= new TemaDAO();
                 ArrayList<Tema> temas= tema.verTema();
                 for(int n=0;n< temas.size();n++){
                     out.print("<li>"+"<a href='"+"./midias/midiatype.jsp?go=theme&name="+temas.get(n).getName()+"' target='_blank'>"+temas.get(n).getName()+"</a></li> ");
                     
                     }}catch(Exception err){
                     
                     }
                 %>
             
              </ul>
               </div>
               
            </aside> 
          <div class="items">
        
              <%
                  
                  try{
               MidiaDAO midia=new MidiaDAO();
               ArrayList<Midia> list = midia.verMidia();
              for(int num=0;num<list.size();num++){
                  out.print("<a href='./midias?name="+list.get(num).getNome()+"&mask_id="+list.get(num).getId()+"''/>"
                  + "<div class='film-content'>"
                  + "<img src='"+list.get(num).getUrl_img()+"'>"
                  + "</div>"
                  + "<p>"+list.get(num).getNome()+"</p>"
                  
                  + ""+"</a>");
                  }
    }catch(Exception e){
    out.print("erro" + e);
    }             
%>
          
          </div>
        </section>
        <footer>
            <p> feito por isaias santos <a href="https://github.com/isaias-silva/assistix" style="background: black; color:#fff; border:1px solid white;" target="_blank" rel="noopener noreferrer">github</a>
    </p>
        </footer>
        <script src="./js/script.js"></script>
    </body>
</html>

