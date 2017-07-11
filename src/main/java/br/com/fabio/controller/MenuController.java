package br.com.fabio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MenuController {

    @RequestMapping("menu")
    public String getFormMenu() {
        return "menu-principal";
    }
    
    @RequestMapping("logout")
    public String getFormLogin() {
        return "redirect:login?logout";
    }
}
