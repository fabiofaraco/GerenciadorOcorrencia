package br.com.fabio.controller;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.service.ProtocoloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @Autowired
    private ProtocoloService service;
    
    @RequestMapping("/login")
    public String formLogin(boolean error, Model model) {

        if (error) {
            model.addAttribute("error", "Nome de usuário/senha inválidos");
        } else {
            model.addAttribute("error", "");
        }
        
        return "login";
    }
    
    @RequestMapping("/autenticar")
    public String formAutentica(String nrAutenticacao, Model model) {
        Protocolo protocolo = service.autenticar(nrAutenticacao);

        if (protocolo == null) {
            return "nao-autenticado";
        } else {
            model.addAttribute("protocolo", protocolo);
            return "autenticado";
        }
    }
}
