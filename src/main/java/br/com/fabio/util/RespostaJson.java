package br.com.fabio.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RespostaJson {

    public static final int MSG_SUCESSO = 1;
    public static final int MSG_ERRO = 2;

    private int id;
    private String mensagem;

    public RespostaJson(int id, String mensagem) {
        this.id = id;
        this.mensagem = mensagem;
    }

    public static String objectToJson(int id, String mensagem) {
        ObjectMapper mapper = new ObjectMapper();
        RespostaJson resposta = new RespostaJson(id, mensagem);
        
        try {
            return mapper.writeValueAsString(resposta);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(RespostaJson.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
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
     * @return the mensagem
     */
    public String getMensagem() {
        return mensagem;
    }

    /**
     * @param mensagem the mensagem to set
     */
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
}
