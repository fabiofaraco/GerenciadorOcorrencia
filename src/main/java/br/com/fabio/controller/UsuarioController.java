package br.com.fabio.controller;

import br.com.fabio.entity.Perfil;
import br.com.fabio.entity.Usuario;
import br.com.fabio.propertyEditor.PerfilPropertyEditor;
import br.com.fabio.repository.PerfilRepository;
import br.com.fabio.service.UsuarioService;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("usuario")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;
    
    @Autowired
    private PerfilRepository perfilRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @InitBinder
    public void customizeBinding(WebDataBinder binder) {
        binder.registerCustomEditor(Perfil.class, new PerfilPropertyEditor());
    }

    @RequestMapping("/lista")
    public String getLista(Model model, String msg) {
        model.addAttribute("usuarios", new ArrayList<>());
        model.addAttribute("msgConsulta", "Para exibir um usuário realize a consulta através do filtro.");

        return "lista-usuario";
    }

    @RequestMapping("/cadastro")
    public String getCadastro(Usuario usuario, Model model) {
        model.addAttribute("perfis", perfilRepository.findAll());

        return "cadastro-usuario";
    }

    @RequestMapping("/filtrar")
    public String filtrar(String nomeFiltro, String cpfFiltro, Model model) {
        model.addAttribute("usuarios", usuarioService.findByNomeOrCpf(nomeFiltro, cpfFiltro));
        model.addAttribute("msgConsulta", "Não há dados para serem exibidos para esta consulta.");
        model.addAttribute("nomeFiltro", nomeFiltro);
        model.addAttribute("cpfFiltro", cpfFiltro);

        return "lista-usuario";
    }

    @RequestMapping("/carregar")
    public String carregar(int id, String nomeFiltro, String cpfFiltro, Model model) {
        model.addAttribute("usuario", usuarioService.findById(id));
        model.addAttribute("perfis", perfilRepository.findAll());
        model.addAttribute("nomeFiltro", nomeFiltro);
        model.addAttribute("cpfFiltro", cpfFiltro);

        return "cadastro-usuario";
    }

    @RequestMapping("/salvar")
    public @ResponseBody String salvarUsuario(Usuario usuario, Model model) {
        usuario.setSenha(bCryptPasswordEncoder.encode(usuario.getSenha()));
        
        usuarioService.salvar(usuario);
        
        return "Operacação realizada com sucesso!";
    }
    
    @RequestMapping("/remover")
    public @ResponseBody String remover(Usuario usuario) {
        usuarioService.deletar(usuario);

        return "Requerente removido com sucesso.";
    }
    
    @RequestMapping("/validaCpf")
    public @ResponseBody String validarCpf(String cpf, int id) {
        if (usuarioService.buscarPorCpf(cpf, id) != null) {
            return "O CPF digitado já está cadastrado no sistema.";
        }
        return "";
    }
}
