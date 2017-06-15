package br.com.fabio.controller;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.NaturezaEvento;
import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.propertyEditor.CidadePropertyEditor;
import br.com.fabio.propertyEditor.EstadoPropertyEditor;
import br.com.fabio.propertyEditor.NaturezaEventoPropertyEditor;
import br.com.fabio.service.OcorrenciaService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("ocorrencia")
public class OcorrenciaController {

    @Autowired
    private OcorrenciaService service;

    @InitBinder
    public void customizeBinding(WebDataBinder binder) {
        binder.registerCustomEditor(NaturezaEvento.class, new NaturezaEventoPropertyEditor());
        binder.registerCustomEditor(Estado.class, new EstadoPropertyEditor());
        binder.registerCustomEditor(Cidade.class, new CidadePropertyEditor());
    }

    @RequestMapping("/lista")
    public String getLista(Model model, String msg) {
        model.addAttribute("ocorrencias", new ArrayList<>());
        model.addAttribute("naturezasEvento", service.getListaNaturezasEvento());
        model.addAttribute("msgConsulta", "Para exibir uma ocorrência realize a consulta através do filtro.");

        return "lista-ocorrencia";
    }

    @RequestMapping("/cadastro")
    public String getCadastro(Ocorrencia ocorrencia, Model model) {
        model.addAttribute("naturezasEvento", service.getListaNaturezasEvento());
        model.addAttribute("estados", service.getListaEstados());

        return "cadastro-ocorrencia";
    }

    @RequestMapping("/carregaCidade")
    public @ResponseBody String carregarCidades(int idEstado) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.writeValueAsString(
                    service.getListaCidadesByIdEstado(idEstado));
            
        } catch (JsonProcessingException e) {
            return "";
        }
    }

    @RequestMapping("/carregar")
    public String carregar(Ocorrencia ocorrencia, Model model) {
        Ocorrencia objOcorrencia = service.getOcorrenciaById(ocorrencia.getId());

        model.addAttribute("ocorrencia", objOcorrencia);
        model.addAttribute("estados", service.getListaEstados());
        model.addAttribute("naturezasEvento", service.getListaNaturezasEvento());
        model.addAttribute("cidades",
                service.getListaCidadesByIdEstado(objOcorrencia.getEndereco()
                                .getCidade().getEstado().getId()));

        return "cadastro-ocorrencia";
    }

    @RequestMapping("/filtrar")
    public String filtrar(int id, int idNaturezaEvento, String dataOcorrencia, Model model) {
        model.addAttribute("ocorrencias",service.filtrar(id, idNaturezaEvento, dataOcorrencia));
        model.addAttribute("naturezasEvento", service.getListaNaturezasEvento());
        model.addAttribute("estados", service.getListaEstados());
        model.addAttribute("msgConsulta", "Não há dados para serem exibidos para esta consulta.");
        model.addAttribute("idFiltro", id);
        model.addAttribute("naturezaEventoFiltro", idNaturezaEvento);
        model.addAttribute("dataOcorrenciaFiltro", dataOcorrencia);
        
        return "lista-ocorrencia";
    }

    @RequestMapping("/salvar")
    public @ResponseBody String salvarOcorrencia(Ocorrencia ocorrencia, Model model) {
        service.salvar(ocorrencia);
        return "Operacação realizada com sucesso!";
    }

    @RequestMapping("/remover")
    public @ResponseBody String remover(Ocorrencia ocorrencia) {
        service.deletar(ocorrencia);
        return "Ocorrência removida com sucesso.";
    }

}
