package model;
/*
 * @author paulogusstavo
 */
public class Localizacao {
    
    private String corBloco;
    private String numBloco;
    
    public Localizacao (String corBloco, String numBloco) {
        this.corBloco = corBloco;
        this.numBloco = numBloco;
    }

    public String getCorBloco() {
        return corBloco;
    }

    public void setCorBloco(String corBloco) {
        this.corBloco = corBloco;
    }

    public String getNumBloco() {
        return numBloco;
    }

    public void setNumBloco(String numBloco) {
        this.numBloco = numBloco;
    }
    
    
}
