package br.com.fabio.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CertidaoService {
    public void gerarCertidao(String nrAutenticacao, HttpSession session,
            HttpServletResponse response) throws Exception;
    
    public boolean validarCodigoAutenticacao(String nrAutenticacao);
}
