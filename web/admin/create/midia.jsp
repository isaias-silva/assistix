<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
     String titulo=request.getParameter("titulo");
     int ano=Integer.parseInt(request.getParameter("ano"));
     String diretor=request.getParameter("diretor");    
     String capa=request.getParameter("capa");
     String wallpaper=request.getParameter("wallpaper");
     int faixa_etaria=Integer.parseInt(request.getParameter("faixa-etaria"));
    String tipo=request.getParameter("tipo");
    int tema=Integer.parseInt(request.getParameter("tema"));
    String enredo=request.getParameter("enredo");
   
    Midia midiaNew= new Midia();
    midiaNew.setNome(titulo);
    midiaNew.setYear(ano);
     midiaNew.setDirector(diretor);
    midiaNew.setId_tema(tema);
    midiaNew.setFaixa_etaria(faixa_etaria);
    midiaNew.setPlot(enredo);
    midiaNew.setType(tipo);
    midiaNew.setWallpaper(wallpaper);
    midiaNew.setUrl_img(capa);
    
    MidiaDAO control=new MidiaDAO();
    try{
         control.cadastrarMidia(midiaNew);
         out.print("midia criada");
         }catch(Exception err){
         out.print("erro ao criar: "+ err);
         }
    
%>
         
    </body>
</html>
