<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="br.com.DAO.ComentDAO" %>
<%@page import="br.com.model.Coment" %>
<!DOCTYPE html>
<html>
    <head>
   
        <title>JSP Page</title>
    </head>
    <body>
        <p>
            <%    
                 String filmname=request.getParameter("film");
                   String autor=request.getParameter("author");
                    String coment=request.getParameter("coment");
                   int id= Integer.parseInt(request.getParameter("mask_id"));
                   int nota= Integer.parseInt(request.getParameter("nota_film"));
                  Coment comentario= new Coment();
                   comentario.setComentador(autor);
            comentario.setComentario(coment);
            comentario.setId_midia(id);
            comentario.setNota(nota);
                  ComentDAO comentdao=new ComentDAO();
                  try{
                  comentdao.comentar(comentario);
                out.print("comentou");
                out.print(filmname);
                out.print(id);
               response.sendRedirect("../midias?name="+filmname+"&mask_id="+id);
                }catch(Exception e){
                   out.print("nao comentou "+e );
                }    
            %>
        </p>
       
    </body>
</html>
