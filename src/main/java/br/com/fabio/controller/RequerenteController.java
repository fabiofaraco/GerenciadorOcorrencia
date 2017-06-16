package br.com.fabio.controller;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.Requerente;
import br.com.fabio.propertyEditor.CidadePropertyEditor;
import br.com.fabio.propertyEditor.EstadoPropertyEditor;
import br.com.fabio.service.RequerenteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("requerente")
public class RequerenteController {

    @Autowired
    private RequerenteService service;

    @InitBinder
    public void customizeBinding(WebDataBinder binder) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);

        binder.registerCustomEditor(Date.class, "dataNascimento", new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class, "dataRequisicao", new CustomDateEditor(dateFormat, true));

        binder.registerCustomEditor(Estado.class, new EstadoPropertyEditor());
        binder.registerCustomEditor(Cidade.class, new CidadePropertyEditor());
    }

    @RequestMapping("/lista")
    public String getLista(Model model, String msg) {
        model.addAttribute("requerentes", new ArrayList<>());
        model.addAttribute("msgConsulta", "Para exibir um requerente realize a consulta através do filtro.");

        return "lista-requerente";
    }

    @RequestMapping("/cadastro")
    public String getCadastro(Requerente requerente, Model model) {

        model.addAttribute("estados", service.getListaEstados());

        return "cadastro-requerente";
    }

    @RequestMapping("/carregaCidade")
    public @ResponseBody String carregarCidades(int idEstado) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.writeValueAsString(service.getListaCidadesByIdEstado(idEstado));
        } catch (JsonProcessingException e) {
            return "";
        }
    }

    @RequestMapping("/carregar")
    public String carregar(Requerente requerente, Model model) {
        Requerente req = service.buscarPorId(requerente.getId());

        model.addAttribute("requerente", req);
        model.addAttribute("estados", service.getListaEstados());
        model.addAttribute("cidades", service
                .getListaCidadesByIdEstado(req.getEndereco().getCidade()
                        .getEstado().getId()));

        return "cadastro-requerente";
    }

    @RequestMapping("/filtrar")
    public String filtrar(String nomeFiltro, String cpfFiltro, Model model) {
        model.addAttribute("requerentes", service.getListaPorNomeOuCpf(nomeFiltro, cpfFiltro));
        model.addAttribute("msgConsulta", "Não há dados para serem exibidos para esta consulta.");
        model.addAttribute("nomeFiltro", nomeFiltro);
        model.addAttribute("cpfFiltro", cpfFiltro);

        return "lista-requerente";
    }

    @RequestMapping("/salvar")
    public @ResponseBody String salvarUsuario(Requerente requerente, Model model) {
        service.salvar(requerente);

        return "Operacação realizada com sucesso!";
    }

    @RequestMapping("/remover")
    public @ResponseBody String remover(Requerente requerente) {
        service.deletar(requerente);

        return "Requerente removido com sucesso.";
    }

    @RequestMapping("/validaCpf")
    public @ResponseBody String validarCpf(String cpf, int id) {

        if (service.buscarPorCpf(cpf, id) != null) {
            return "O CPF digitado já está cadastrado no sistema";
        }

        return "";
    }
}
