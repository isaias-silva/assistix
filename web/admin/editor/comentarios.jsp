<%@page import="br.com.DAO.MidiaDAO" %>
<%@page import="br.com.model.Midia" %>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ComentDAO" %>
<%@page import="br.com.model.Coment" %>
<%@page import="br.com.model.Admin" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>comentarios</title>
                 <link rel="stylesheet" href="../../css/login.css"/>
 
    </head>
    <body>
        <h1>lista de comentarios</h1>
        <a href="../dashboard.jsp" style="background: blue; padding: 2px; border-radius: 10px">retornar</a>
        <table>
         
              
        <%   if(session.getAttribute("admin")==null){
                      response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
            
        }else{
                  
                  try{
                    Admin adm=(Admin)session.getAttribute("admin"); 
                  MidiaDAO midia=new MidiaDAO();
               ComentDAO control=new ComentDAO();
               ArrayList<Coment> lista;
               ArrayList<Midia> list;
               if(adm.getClasse().equals("master")){
            list=midia.verMidia();
            }else{
            list=midia.midiaAdmin(adm.getId()); 
            
            }
           
              for(int num=0;num<list.size();num++){
           
             
           
               
            
              out.print("<tr>");    
              out.print("<th colspan='100%' style='font-size:24px'>"+list.get(num).getNome()+"</th>");
              out.print("</tr>");   
            lista=control.vercoment(list.get(num).getId()); 
              for(int numt=0;numt<lista.size(); numt++){
              out.print("<tr>");    
          out.print("<th colspan='2' rowspan='2'>"+lista.get(numt).getComentador()+"</th>");
             
              out.print("<td colspan='50%'>"+lista.get(numt).getComentario()+"</td>");
              out.print("<td><a href='../delete/comentario.jsp?id="+lista.get(numt).getId()+"'><img style='width: 40px' src='https://images.emojiterra.com/google/noto-emoji/v2.034/128px/1f5d1.png'></a></td>");
              out.print("<tr>");  
            }
              lista.clear(); 
            }
           
                }catch(Exception e){
    out.print("erro" + e);
    }    }         
%>
</table>
    </body>
</html>
