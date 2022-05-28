

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.DAO.midiaDAO" %>
<%@page import="br.com.DAO.comentDAO" %>
<%@page import="br.com.model.Coment" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.util.Etary" %>
<%@page import="br.com.util.Media" %>
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
       Media media= new Media();
     //modelo de media--------------------------------------
       ArrayList<Integer> notas=new ArrayList();
       notas.add(3);
       notas.add(3);
       notas.add(10);
       notas.add(9);
       int medianotas=media.media(notas);
     //-----------------------------------------------------------
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
     + "<p style='margin-top:20px; font-size: 24px'>"+midiares.getTema()+"</p>"
    
     + "<div class='indicative'>"
      + idadehtml
      + "</div>"
      + "<div style='margin-top:20px'>"
      +"<h2>avaliação média</h2>"
      +"<div class='nota'>"+medianotas+"</div>"
      + "</div>"
      
      + "</div>"
      );
        
       
            }catch(Exception e){      
    out.print(e);   
       
              
    }
%>
   </section>
   <section class="coments">
    
       <h2>Comentários</h2>
           
          <form action="../coment/send.jsp" method="POST">
                 <input type="hidden" name="film" value=<% out.print("'"+request.getParameter("name")+"'");%>>
              <input type="hidden" name="mask_id" value=<%  out.print(request.getParameter("mask_id"));%>>
           <label for="nm">
               <p>seu nome</p>
           </label>
              <input id="nm" name="author" type="text" placeholder="seu nome">
             <label for="nota">
               <p>sua nota</p>
           </label> 
              <span style="color:red;font-weight: bold;">0</span><input id="nota" name="nota_film" type="range" min="0" max="10"><span style="color:green; font-weight: bold;">10</span>
           <label for="comn">
               <p>seu comentário</p>
           </label>
           <textarea name="coment" id="comn" class="input_coment" placeholder="comentário">
               
           </textarea>
              <button value="submit">
                  comentar
              </button>
       </form>
           <div class="comented">
               <h3>joãozinho matuto</h3><span>01/01/2001</span>
               <p>exemplo de comentario exemplo de comentario exemplo de comentario exemplo de comentario</p>
           </div>
              <%
              int id=Integer.parseInt(request.getParameter("mask_id"));
              try{
              comentDAO control=new comentDAO();
              ArrayList<Coment> lista=control.vercoment(id);
             
                for(int num=0; num<lista.size(); num++){
                  out.print("<div class='comented'>"
                  + "<h3>"+lista.get(num).getComentador()+"</h3>"
                  + "<span>"+lista.get(num).getDate()+"</span>"
                  + "<p>"+lista.get(num).getComentario()+"</p>"
                  
                  + "</div>");
                  
                  }
                  
                  }catch(Exception err){
                  out.print(err);
                  }
              %>
   </section>
       <footer>
            <p>2022 &copy;</p>
        </footer>
    </body>
</html>
