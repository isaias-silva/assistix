/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Hash {
 public String hash(String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException{
       MessageDigest algorithm = MessageDigest.getInstance("MD5");
        byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
         StringBuilder hexString = new StringBuilder();
     for (byte b : messageDigest) {
              hexString.append(String.format("%02X", 0xFF & b));
     }
        
        
        return hexString.toString();
       
 }
}
