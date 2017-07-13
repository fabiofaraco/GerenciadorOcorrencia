package br.com.fabio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String formLogin(boolean error, Model model) {

        if (error) {
            model.addAttribute("error", "Nome de usuário/senha inválidos");
        } else {
            model.addAttribute("error", "");
        }
        
        return "login";
    }
}
