package br.com.fabio.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Grafico implements Serializable {

    private String title;
    private String tipoGrafico;
    private List<?> eixos;

    public Grafico() {
    }

    public Grafico(String title, String tipoGrafico, List<?> eixos) {
        this.title = title;
        this.tipoGrafico = tipoGrafico;
        this.eixos = eixos;
    }

    public String convertGraphicToJson() {
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.writeValueAsString(this);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(RespostaJson.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the eixos
     */
    public List<?> getEixos() {
        return eixos;
    }

    /**
     * @param eixos the eixos to set
     */
    public void setEixos(List<?> eixos) {
        this.eixos = eixos;
    }

    /**
     * @return the tipoGrafico
     */
    public String getTipoGrafico() {
        return tipoGrafico;
    }

    /**
     * @param tipoGrafico the tipoGrafico to set
     */
    public void setTipoGrafico(String tipoGrafico) {
        this.tipoGrafico = tipoGrafico;
    }
}
