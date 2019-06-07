package model;

/**
 * @author paulogusstavo
 */
public class Devolucao {
    
    private String codigoObjeto;
    private String pessoa;
    private String observacao;

    public Devolucao(String codigoObjeto, String pessoa, String observacao) {
        this.codigoObjeto = codigoObjeto;
        this.pessoa = pessoa;
        this.observacao = observacao;
    }

    public String getCodigoObjeto() {
        return codigoObjeto;
    }

    public void setCodigoObjeto(String codigoObjeto) {
        this.codigoObjeto = codigoObjeto;
    }

    public String getPessoa() {
        return pessoa;
    }

    public void setPessoa(String pessoa) {
        this.pessoa = pessoa;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

}
