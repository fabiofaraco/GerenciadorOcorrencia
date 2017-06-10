package br.com.fabio.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cidade")
public class Cidade implements Serializable {

    @Id
    @GeneratedValue
    private int id;

    private String nome;

    @Column(name = "codigo_ibge")
    private int codigoIbge;

    @ManyToOne
    @JoinColumn(name = "estado_id")
    private Estado estado = new Estado();

    @Column(name = "populacao_2010")
    private int populacao;

    @Column(name = "densidade_demo")
    private BigDecimal densidadeDemografica;

    private String gentilico;
    private BigDecimal area;

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
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the codigoIbge
     */
    public int getCodigoIbge() {
        return codigoIbge;
    }

    /**
     * @param codigoIbge the codigoIbge to set
     */
    public void setCodigoIbge(int codigoIbge) {
        this.codigoIbge = codigoIbge;
    }

    /**
     * @return the estado
     */
    public Estado getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    /**
     * @return the populacao
     */
    public int getPopulacao() {
        return populacao;
    }

    /**
     * @param populacao the populacao to set
     */
    public void setPopulacao(int populacao) {
        this.populacao = populacao;
    }

    /**
     * @return the densidadeDemografica
     */
    public BigDecimal getDensidadeDemografica() {
        return densidadeDemografica;
    }

    /**
     * @param densidadeDemografica the densidadeDemografica to set
     */
    public void setDensidadeDemografica(BigDecimal densidadeDemografica) {
        this.densidadeDemografica = densidadeDemografica;
    }

    /**
     * @return the gentilico
     */
    public String getGentilico() {
        return gentilico;
    }

    /**
     * @param gentilico the gentilico to set
     */
    public void setGentilico(String gentilico) {
        this.gentilico = gentilico;
    }

    /**
     * @return the area
     */
    public BigDecimal getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    public void setArea(BigDecimal area) {
        this.area = area;
    }

}
