<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.model.Midia" %>
<%@page import="br.com.model.Tema" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="../../css/editor.css"/>
   
        <title>editor</title>
         
    </head>
    <body>
        <form action="../create/midia.jsp" method="POST">
            <label for="titulo">titulo</label>
            <input type="text" name="titulo" id="titulo" >
           <label for="ano">ano</label>
            
            <input type="number" name="ano" max="2023" min="1900" id="ano">
            <label for="diretor">diretor</label>
             
            <input type="text" name="diretor" id="diretor">
            <label for="urlcapa">link capa</label>
              
            <input type="url" id="urlcapa" name="capa" >
            <label for="wl">link wallpaper</label>   
            <input type="url" id="wl" name="wallpaper">
            <label for="faixa-etaria">faixa etária</label>  
            <select id="faixa-etaria" name="faixa-etaria">
                <option value="0">Livre para todos os públicos</option>
                <option value="10">+10</option>
                 <option value="12">+12</option>
                  <option value="14">+14</option>
                   <option value="16">+16</option>
                    <option value="10">+18</option>
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
