package br.com.fabio.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Protocolo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @OneToOne
    @JoinColumn(name = "id_requerente")
    private Requerente requerente = new Requerente();

    @OneToOne
    @JoinColumn(name = "id_ocorrencia")
    private Ocorrencia ocorrencia = new Ocorrencia();

    @Column(name = "codigo_autenticacao")
    private String codigoAutenticacao;

    public Protocolo() {
    }

    public Protocolo(int id, int idRequerente, int idOcorrencia, String codigoAutenticacao) {
        this.id = id;
        this.requerente.setId(idRequerente);
        this.ocorrencia.setId(idOcorrencia);
        this.codigoAutenticacao = codigoAutenticacao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Requerente getRequerente() {
        return requerente;
    }

    public void setRequerente(Requerente requerente) {
        this.requerente = requerente;
    }

    public Ocorrencia getOcorrencia() {
        return ocorrencia;
    }

    public void setOcorrencia(Ocorrencia ocorrencia) {
        this.ocorrencia = ocorrencia;
    }

    public String getCodigoAutenticacao() {
        return codigoAutenticacao;
    }

    public void setCodigoAutenticacao(String codigoAutenticacao) {
        this.codigoAutenticacao = codigoAutenticacao;
    }
}
