package model;

import java.util.Date;

/*
 * @author paulogusstavo
    id INT,
    nome VARCHAR(100),
    cor VARCHAR(50),
    codigo VARCHAR(50),
    data_encontrado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    localizacao_FK INT,
 */
public class ObjetoPerdido {
    
    private String nome;
    private String cor;
    private String codigo;
    private Localizacao localizacao;
    private String dataCadastrado;
    
    public ObjetoPerdido () { }

    public ObjetoPerdido(String nome, String cor, String codigo, Localizacao localizacao) {
        this.nome = nome;
        this.cor = cor;
        this.codigo = codigo;
        this.localizacao = localizacao;
    }
    
    public ObjetoPerdido(String nome, String cor, String codigo, Localizacao localizacao, String dataCadastrado) {
        this.nome = nome;
        this.cor = cor;
        this.codigo = codigo;
        this.localizacao = localizacao;
        this.dataCadastrado = dataCadastrado;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    public String getDataCadastrado() {
        return dataCadastrado;
    }

    public void setDataCadastrado(String dataCadastrado) {
        this.dataCadastrado = dataCadastrado;
    }
    
    
    
}
