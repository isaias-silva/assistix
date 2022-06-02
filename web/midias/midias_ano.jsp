<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
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
    <link rel="stylesheet" href="../css/style.css"/>
   
    </head>
    <body>
        <header>
            <h1><a href="../">Assistix</a></h1>
            <form class="busca" method="GET" action="./pesquisar.jsp">
                <input type="search" placeholder="pesquisar" id="sch" name="search">
  
            </form>
            </header>
       
        <section>
           
            <div class="capa">
               </div>
              <div class="capa-help"></div>
           
          
          <div class="items busca">
        
              
              <%
                  
                  try{
               MidiaDAO midia=new MidiaDAO();
             
               ArrayList<Midia> list = midia.midias_do_ano();
              for(int num=0;num<list.size();num++){
                  out.print("<a href='./mid.jsp?name="+list.get(num).getName()+"&mask_id="+list.get(num).getId()+"''/>"
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
