<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.ComentDAO" %>
<%@page import="br.com.model.Coment" %>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.util.Etary" %>
<%@page import="br.com.util.Media" %>
<%@page import="br.com.util.Notarender" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
 
        <link rel="stylesheet" href="../css/estilo.css"/>
        <title>
            <%
             out.print(request.getParameter("name"));
            %>
        </title>
    </head>
    <body>

        <section class="film-page">

            <%
             String tm="";
            String name = request.getParameter("name");
             int id=Integer.parseInt(request.getParameter("mask_id"));
             
            MidiaDAO midia=new MidiaDAO();
            ComentDAO control=new ComentDAO();
            Notarender n_render=new Notarender();
            try{
       
           Midia midiares=midia.irparaMidia(name);
           Etary etary= new Etary();
           Media media= new Media();
         //--------------------------------------
           ArrayList<Integer> notas=control.vernotas(id);
           
           int medianotas=media.media(notas);
           if(midiares.getNome()==null){
                                   response.sendError(HttpServletResponse.SC_BAD_REQUEST);   
  
                }
         //-----------------------------------------------------------
           String idadehtml=etary.criar_idade(midiares.getFaixa_etaria());
          out.print("<div class='target-film'>"
    
          + "<img src='"+midiares.getWallpaper()+"' /> "
          + "<div class='img-sdw'></div>"
          + "  <a href='../' class='return'> <img src='https://i.pinimg.com/originals/e8/e9/27/e8e927958105ca2b267bd47a99a19696.png'> </a>"  
          + "</div>");
    
          out.print("<div class='info-film'>"
          + "<h1>"+midiares.getNome()+"</h1>"
          + "<p><b>"+midiares.getYear()+"</b></p>"
          + "<p>"+midiares.getDirector()+"</p>"
    
          + "<p style='margin-top:20px'>"+midiares.getPlot()+"</p>"
         + "<p style='margin-top:20px; font-size: 24px'>"+midiares.getTema()+"</p>"
    
         + "<div class='indicative'>"
          + idadehtml
          + "</div>"
          + "<div style='margin-top:20px'>"
          +"<h2>avalia��o m�dia</h2>"
          +n_render.notatotal_render(medianotas)
          + "</div>"
      
          + "</div>"
          );
        
       tm=midiares.getTema();
                }catch(Exception e){      
        out.print(e);   
       
              
        }
            %>
        </section>
        <div class="relacionados">
            <h2>filmes e s�ries relacionados:</h2>

            <div class="carrosel">
                <button value="return" onclick="move(this.value)">&lt;</button>
                <div class="control">
                    <div class="items" left="0">
                        <%
                                          try{
              
               ArrayList<Midia> list = midia.midias_relacionadas(tm);
              for(int num=0;num<list.size();num++){
                  out.print("<a href='../midias?name="+list.get(num).getNome()+"&mask_id="+list.get(num).getId()+"''/>"
                  + "<div class='film-content'>"
                  + "<img src='"+list.get(num).getUrl_img()+"'>"
                  + "</div>"
                  + ""+"</a>");
                  }
    }catch(Exception e){
    out.print("erro" + e);
    } 
                        
                        %>

                    </div>
                </div>
                <button value="go" onclick="move(this.value)" >&gt;</button>

            </div>
        </div>
        <section class="coments">

            <h2>Coment�rios</h2>

            <form action="../coment/send.jsp" method="POST">
                <input type="hidden" name="film" value=<% out.print("'"+request.getParameter("name")+"'");%>>
                <input type="hidden" name="mask_id" value=<%  out.print(request.getParameter("mask_id"));%>>
                <label for="nm">
                    <p>seu nome</p>
                </label>
                <input id="nm" name="author" type="text" placeholder="seu nome" required>
                <label for="nota">
                    <p>sua nota</p>
                </label> 
                <span style="color:red;font-weight: bold;">0</span><input id="nota" name="nota_film" type="range" min="0" max="10" required=""><span style="color:green; font-weight: bold;">10</span>
                <label for="comn">
                    <p>seu coment�rio</p>
                </label>
                <textarea name="coment" id="comn" class="input_coment" placeholder="coment�rio" maxlength="350" required>
               
                </textarea>
                <button value="submit">
                    comentar
                </button>
            </form>
                <div class="comentary">
            <%
           
            try{
          
            ArrayList<Coment> lista=control.vercoment(id);
             
              for(int num=0; num<lista.size(); num++){
                out.print("<div class='comented'>"
                + "<h3>"+lista.get(num).getComentador()+"</h3>"
                + "<span>"+lista.get(num).getDate()+"</span>"
                + "<div class='note'>"+n_render.notaindividual_render(lista.get(num).getNota())+"</div>"
                + "<p>"+lista.get(num).getComentario()+"</p>"
                  
                + "</div>");
                  
                }
                  
                }catch(Exception err){
                out.print(err);
                }
            %>
                </div>
        </section>
        <footer>
            <p>2022 &copy;</p>
        </footer>
        <script src="../js/script.js"></script>
    </body>
</html>
