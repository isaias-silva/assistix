
package br.com.model;

public class Tema {
    private int id;
    private String name;
    public String getName(){
        return name;
    }
    public void setName(String value){
    this.name=value;
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
}
