package br.com.util;

import java.util.Random;

public class Altercapa {

    public String[] capas = {"https://images5.alphacoders.com/764/thumb-1920-764519.jpg", "https://wallpaperaccess.com/full/1264779.jpg", "https://images2.alphacoders.com/110/1107439.jpg", "https://wallpapercave.com/wp/wp1993742.jpg", "https://steamuserimages-a.akamaihd.net/ugc/1634200392236720867/92E8DC547243F080C008B963CAE0C099C4524665/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false", "https://images6.alphacoders.com/909/thumb-1920-909641.png", "https://wallpaperaccess.com/full/2222765.jpg","https://images.alphacoders.com/660/thumb-1920-660003.jpg","https://images2.alphacoders.com/113/thumb-1920-1132651.jpg","https://images8.alphacoders.com/100/thumb-1920-1003220.png","https://img.olhardigital.com.br/wp-content/uploads/2022/03/feiticeira-escarlate.jpg"};

    public String capareturn() {
        Random gerador = new Random();
        return capas[gerador.nextInt(capas.length)];
    }

}
