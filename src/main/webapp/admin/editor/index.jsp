<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page import="br.com.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
     
           <link rel="stylesheet" href="../../css/editor.css"/>
       <% 
  Admin adm=(Admin)session.getAttribute("admin");  
         
       
       %>
        <title>editor</title>
         
    </head>
    <body>
        <%
             if(adm!=null){
         
            }else{
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
           
            }
        %>
        <form action="../create/midia.jsp" method="POST">
            <img src="https://cdn-icons-png.flaticon.com/512/21/21194.png" alt="alt"/>
            <input type="hidden" name="idadm" value="<%if(adm!=null){out.print(adm.getId());}%>">
            <label for="titulo">titulo</label>
            <input type="text" name="titulo" id="titulo" required>
           <label for="ano">ano</label>
            
            <input type="number" name="ano" max="2023" min="1900" id="ano" required>
            <label for="diretor">diretor</label>
             
            <input type="text" name="diretor" id="diretor" required>
            <label for="urlcapa">link capa</label>
              
            <input type="url" id="urlcapa" name="capa" >
            <label for="wl">link wallpaper</label>   
            <input type="url" id="wl" name="wallpaper" required>
            <label for="faixa-etaria">faixa etária</label>  
            <select id="faixa-etaria" name="faixa-etaria">
                <option value="0">Livre para todos os públicos</option>
                <option value="10">+10</option>
                 <option value="12">+12</option>
                  <option value="14">+14</option>
                   <option value="16">+16</option>
                    <option value="18">+18</option>
            </select>
            <label for="tipo">tipo</label>
                <select id="tipo" name="tipo">
                    <option value="filme">filme</option>
                    <option value="série">série</option>
                </select>
            <label for="tema">tema</label>
            <select id="tema" name="tema">
<%
               try{
                 TemaDAO tema= new TemaDAO();
                 ArrayList<Tema> temas= tema.verTema();
                 for(int n=0;n< temas.size();n++){
                     out.print("<option value='"+temas.get(n).getId()+"'>"+temas.get(n).getName()+"</option> ");
                     
                     }}catch(Exception err){
                     
                     }
                
%>
                </select>
            <label for="enredo">enredo</label>
            <textarea id="enredo" name="enredo" ></textarea>
            <input type="submit" value="criar">
        </form>
        </body>
</html>
