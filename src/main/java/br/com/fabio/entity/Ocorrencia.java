package br.com.fabio.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "ocorrencia")
public class Ocorrencia implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Temporal(TemporalType.DATE)
    @Column(name = "data_ocorrencia")
    private Date dataOcorrencia;

    @Column(name = "hora_ocorrencia")
    private String horaOcorrencia;

    private String responsavel;

    @ManyToOne
    @JoinColumn(name = "id_natureza_evento")
    private NaturezaEvento naturezaEvento = new NaturezaEvento();

    @Embedded
    private Endereco endereco = new Endereco();

    @Column(name = "relato_fatos", length = 1000)
    private String relato;

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
     * @return the dataOcorrencia
     */
    public Date getDataOcorrencia() {
        return dataOcorrencia;
    }

    /**
     * @param dataOcorrencia the dataOcorrencia to set
     */
    public void setDataOcorrencia(Date dataOcorrencia) {
        this.dataOcorrencia = dataOcorrencia;
    }

    /**
     * @return the responsavel
     */
    public String getResponsavel() {
        return responsavel;
    }

    /**
     * @param responsavel the responsavel to set
     */
    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    /**
     * @return the naturezaEvento
     */
    public NaturezaEvento getNaturezaEvento() {
        return naturezaEvento;
    }

    /**
     * @param naturezaEvento the evento to set
     */
    public void setNaturezaEvento(NaturezaEvento naturezaEvento) {
        this.naturezaEvento = naturezaEvento;
    }

    /**
     * @return the endereco
     */
    public Endereco getEndereco() {
        return endereco;
    }

    /**
     * @param endereco the endereco to set
     */
    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    /**
     * @return the relato
     */
    public String getRelato() {
        return relato;
    }

    /**
     * @param relato the relato to set
     */
    public void setRelato(String relato) {
        this.relato = relato;
    }

    /**
     * @return the horaOcorrencia
     */
    public String getHoraOcorrencia() {
        return horaOcorrencia;
    }

    /**
     * @param horaOcorrencia the horaOcorrencia to set
     */
    public void setHoraOcorrencia(String horaOcorrencia) {
        this.horaOcorrencia = horaOcorrencia;
    }
}
