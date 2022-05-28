

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.DAO.midiaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.util.Etary" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="../css/style.css"/>
       <title>
           <%
            out.print(request.getParameter("name"));
           %>
       </title>
    </head>
    <body>
        <section class="film-page">
        <%
     
        String name = request.getParameter("name");
        midiaDAO midia=new midiaDAO();
        try{
       
       Midia midiares=midia.irparaMidia(name);
       Etary etary= new Etary();
       String idadehtml=etary.criar_idade(midiares.getFaixa_etaria());
      out.print("<div class='target-film'>"
      + "<img src='"+midiares.getWallpaper()+"' /> "
      + "<div class='img-sdw'></div>"
      
      + "</div>");
      out.print("<div class='target-film'>"
      + ""
      + "</div>");
      out.print("<div class='info-film'>"
      + "<h1>"+midiares.getName()+"</h1>"
      + "<p><b>"+midiares.getYear()+"</b></p>"
      + "<p>"+midiares.getDirector()+"</p>"
    
      + "<p style='margin-top:20px'>"+midiares.getPlot()+"</p>"
      + "<div class='indicative'>"
      + idadehtml
      + "</div>"
      + "</div>");
        
       
            }catch(Exception e){      
    out.print(e);   
       
              
    }
%>
   </section>
   <section class="coments">
       
   </section>
       <footer>
            <p>2022 &copy;</p>
        </footer>
    </body>
</html>
