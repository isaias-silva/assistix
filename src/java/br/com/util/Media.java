
package br.com.util;

import java.util.ArrayList;


public class Media {
    public int media(ArrayList<Integer> notas){
        int num=0;
        for(int i=0;i<notas.size();i++){
           num+=notas.get(i);
        }
       
        return num/notas.size();
    }
}
