<%@page import="br.com.DAO.AdminDAO" %>
<%@page import="br.com.model.Admin" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="../../css/login.css"/>
   
        <title>criar admin</title>
           <% 
       Admin adm=(Admin)session.getAttribute("admin");
       if(adm.getClasse().equals("master")==false){
       response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        
               }
          AdminDAO control= new AdminDAO();
           ArrayList<Admin> lista_two=new ArrayList();
          ArrayList<Admin> lista=control.verAdmins();
          
           for(int x=0; x<lista.size();x++){
           lista_two.add(lista.get(x));    
           if(lista.get(x).getNickname().equals(adm.getNickname())){
               lista.remove(x);
               }
               }
          
      
       %>
    </head>
    <body>
        <table>
            <tr>
                <th>Nickname</th>
                <th>classe</th>
                <th>opção</th>
            </tr>
            <%
            for(int i=0; i<lista.size();i++){
               out.print("<tr>"
               + "<td>"
               + lista.get(i).getNickname()
               + "</td>"
               + "<td>"
               + lista.get(i).getClasse()
               + "</td>"
               + "<td>"
               + "<a href='../delete/admin.jsp?id="+lista.get(i).getId()+"'>deletar</a>"
               + "</td>"
               + "</tr>");
                }
            %>
        </table>
        <div class="login admincreate">
            <h1>criar admin</h1>
        <form action="../create/createadmin.jsp" method="POST">
            <input type="text" name="nickname" required>
            <input type="password" name="pass" required>
            
            <select name="classe" onchange="aviso(this.value)">
                <option value="basic">basic</option>
                <option value="master">master</option>
            </select>
            <p style="color:red; font-weight: bold; background:black;margin: 5px;" id="aviso"></p>
       <input type="submit" value="criar admin" onclick="return check()" />
        </form>
    </div>
        
        <script>
            function aviso(value){
                let aviso= document.getElementById("aviso");
            if(value==="master"){
                    aviso.innerText="o master tem todas as permissões possíveis da aplicação";            
                }
                if(value==="basic"){
            
            aviso.innerText=" ";       
                }
            }
         function check(){
                let nick=document.querySelector("input");
                let users=[];
                        <%
                        for(int y=0;y<lista.size();y++){
                            out.print("users["+y+"]="+"'"+lista_two.get(y).getNickname()+"'\n");
                            }
                        %>
         
                 for(let i in users){
                     if(nick.value==users[i]){
                         alert("usuario já existe");
                         return false;
                 }
          } 
                
}
        </script>
        </body>
</html>
