package br.com.fabio.controller;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.service.ProtocoloService;
import br.com.fabio.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private ProtocoloService service;

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("/login")
    public String formLogin(boolean error, Model model) {

        if (error) {
            model.addAttribute("error", "Nome de usuário/senha inválidos");
        } else {
            model.addAttribute("error", "");
        }

        return "login";
    }

    @RequestMapping("/voltarLogin")
    public String formBackToLogin(Model model) {
        model.addAttribute("error", "");

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

    @RequestMapping("/redefinirSenha")
    public @ResponseBody String redefinirSenha(String email, Model model) {
        
        int resposta = usuarioService.emailRedefinirSenha(email);
        
        return String.valueOf(resposta);
    }
}
