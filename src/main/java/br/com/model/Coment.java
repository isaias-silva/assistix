package br.com.model;

import java.util.Date;

public class Coment {

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    private String comentario;
    private String comentador;
    private int nota;
    private int id_midia;
    private Date date;
    private int id;
  private String midiaName;
   public Coment(){
       date=new Date();
        
   }
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * @return the comentador
     */
    public String getComentador() {
        return comentador;
    }

    /**
     * @param comentador the comentador to set
     */
    public void setComentador(String comentador) {
        this.comentador = comentador;
    }

    /**
     * @return the nota
     */
    public int getNota() {
        return nota;
    }

    /**
     * @param nota the nota to set
     */
    public void setNota(int nota) {
        this.nota = nota;
    }

    /**
     * @return the id_midia
     */
    public int getId_midia() {
        return id_midia;
    }

    /**
     * @param id_midia the id_midia to set
     */
    public void setId_midia(int id_midia) {
        this.id_midia = id_midia;
    }

    /**
     * @return the date
     */
    public java.sql.Date getDate() {
      java.sql.Date dataSql = new java.sql.Date(date.getTime());
   
    return dataSql;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the midiaName
     */
    public String getMidiaName() {
        return midiaName;
    }

    /**
     * @param midiaName the midiaName to set
     */
    public void setMidiaName(String midiaName) {
        this.midiaName = midiaName;
    }

    /**
     * @param date the date to set
     */
  
}
