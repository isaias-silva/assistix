package br.com.util;


public class Notarender {
    public String notatotal_render(int nota){
      String notahtml="";
        if(nota<7 && nota>3){
        notahtml="<div class='nota' style='background:orange;'>"+nota+"</div>";
        }
        if(nota>=7){
        
         notahtml="<div class='nota' style='background:green;'>"+nota+"</div>";
  
        }
          if(nota<=3){
        
         notahtml="<div class='nota' style='background:red;'>"+nota+"</div>";
  
        }
        return notahtml;
        
  
    }
    public String notaindividual_render(int nota){
 
     String notahtml="";
        if(nota<7 && nota>3){
        notahtml="<div class='note' style='background:orange;'>"+nota+"</div>";
        }
        if(nota>=7){
        
         notahtml="<div class='note' style='background:green;'>"+nota+"</div>";
  
        }
          if(nota<=3){
        
         notahtml="<div class='note' style='background:red;'>"+nota+"</div>";
  
        }
        return notahtml;
    }
}
