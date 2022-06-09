<%@page import="br.com.DAO.TemaDAO" %>
<%@page import="br.com.model.Tema" %>
<%@page import="br.com.model.Admin" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editor de tema</title>
        <link rel="stylesheet" href="../../css/login.css"/>
 
    </head>
    <body>
        <h1>temas</h1>
  
        <table>
            <tr>
                <th>tema</th>
                <th colspan="2">filmes</th>  
                 
                
            </tr>
            <%
             if(session.getAttribute("admin")==null){
                      response.sendError(HttpServletResponse.SC_UNAUTHORIZED);   
                      
        }else{
                Admin adm=(Admin)session.getAttribute("admin"); 
                if(adm.getClasse().equals("master")){
        TemaDAO control=new TemaDAO();
                ArrayList<Tema> list;
                try{
                list=control.verTema();
                
                for(int num=0; num<list.size(); num++){
                out.print("<tr>");
                out.print("<td>"+list.get(num).getName()+"</dr>");
               out.print("<td><a href='../../midias/midiatype.jsp?go=theme&name="+list.get(num).getName()+"' target='_blank'>ver filmes</a></dr>");
               
                out.print("<td><a href='../delete/tema.jsp?id="+list.get(num).getId()+"'><img style='width: 40px' src='https://images.emojiterra.com/google/noto-emoji/v2.034/128px/1f5d1.png'></a></td>");
                out.print("</tr>");
          
                }}catch(Exception err){
                     }
                
                }}
            %>
   
            
        </table>
                  <form method="POST"  action="../create/tema.jsp" class="login">
            <label for="tema" style="font-size:18px">criar tema</label>
            <input type="text" name="tema_nome" id="tema" placeholder="nome do tema" required>
            <input type="submit" value="criar">
        </form>
                 <a href="../" style="background: blue; padding: 5px; border-radius: 10px;">retornar</a>
 
    </body>
</html>
