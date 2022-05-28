/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.util;

import java.util.ArrayList;
//netbeans
/**
 *
 * @author eduardo
 */
public class Etary {
private String[] cores={"#00FF00","#00CED1","#FFFF00","#FF8C00","#FF0000","#000"};

public String criar_idade(int idade){
   String html="";
   
    switch(idade){
        case(0):
            html="<div class='idade' style='background:"+cores[0]+"'>"
                    + "L"            
               + "</div>";
        break;
        case(10):
            html="<div class='idade' style='background:"+cores[1]+"'>"
                    + idade            
               + "</div>";
        break;
         case(12):
            html="<div class='idade' style='background:"+cores[2]+"'>"
                    + idade            
               + "</div>";
        break;
         case(14):
            html="<div class='idade' style='background:"+cores[3]+"'>"
                    + idade            
               + "</div>";
        break;
         case(16):
            html="<div class='idade' style='background:"+cores[4]+"'>"
                    + idade            
               + "</div>";
        break;
         case(18):
            html="<div class='idade' style='background:"+cores[5]+"'>"
                    + idade            
               + "</div>";
        break;
        default:
            html="<div class='idade'>"
                    + idade            
               + "</div>";
        break;
    }
    return html;
}
}
