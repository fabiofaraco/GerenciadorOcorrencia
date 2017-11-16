package br.com.fabio.controller;

import br.com.fabio.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MenuController {
    
    @Autowired
    private MenuService menuService;
    
    @RequestMapping({"", "/"})
    public String getFormMenu(Model model) {
        
        Object usuarioLogado = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        
        if (usuarioLogado instanceof UserDetails) {
            model.addAttribute("usuarioLogado", ((UserDetails) usuarioLogado)
                    .getUsername());
        }
        
        model.addAttribute("menu", menuService.montarMenu());
        
        return "menu-principal";
    }
    
    @RequestMapping("/logout")
    public String getFormLogin() {
        return "redirect:login?logout";
    }
}
