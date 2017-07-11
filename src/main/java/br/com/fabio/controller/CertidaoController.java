package br.com.fabio.controller;

import br.com.fabio.service.CertidaoService;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("certidao")
public class CertidaoController {

    @Autowired 
    private CertidaoService certidaoService;
    
    @RequestMapping("/")
    public String getForm(Model model) {
        return "certidao";
    }

    @RequestMapping("/certidaoOcorrencia")
    public void gerarCertidao(String nrAutenticacao, HttpSession session, HttpServletResponse response) {

        try 
        {
            certidaoService.gerarCertidao(nrAutenticacao, session, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/validarAutenticacao") 
    public @ResponseBody String validarAutenticacao(String nrAutenticacao) {
        
        if(!certidaoService.validarCodigoAutenticacao(nrAutenticacao)) {
            return "Código de Autenticação não encontrado";
        }
        
        return "";
    }
}
