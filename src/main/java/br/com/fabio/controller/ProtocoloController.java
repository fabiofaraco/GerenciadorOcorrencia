package br.com.fabio.controller;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.service.ProtocoloService;
import br.com.fabio.service.RequerenteService;
import br.com.fabio.serviceImpl.OcorrenciaServiceImpl;
import br.com.fabio.util.RespostaJson;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("protocolo")
public class ProtocoloController 
{
    @Autowired
    private ProtocoloService service;
    @Autowired
    private RequerenteService requerenteService;
    @Autowired
    private OcorrenciaServiceImpl ocorrenciaService;
    
    @InitBinder
    public void customizeBinding(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);

        binder.registerCustomEditor(Date.class, "dataOcorrencia", new CustomDateEditor(dateFormat, true));
    }
    
    @RequestMapping("/lista")
    public String getLista(Model model) {
        
        model.addAttribute("ocorrencias", new ArrayList<>());
        model.addAttribute("msgConsulta", "Para exibir um protocolo realize a consulta através do filtro.");

        return "lista-protocolo";
    }
        
    @RequestMapping("/cadastro")
    public String getCadastro(Protocolo protocolo, Model model) {
        
        return "cadastro-protocolo";
    }
    
    @RequestMapping("/carregaRequerente")
    public @ResponseBody String getCarregarRequerente(String cpf) throws JsonProcessingException {
        
        ObjectMapper mapper = new ObjectMapper();
        
        try {
            return mapper.writeValueAsString(requerenteService.buscarPorCpf(cpf, 0));
        } catch (JsonProcessingException e) {
            throw e;
        }
    }
    
    @RequestMapping("/carregaOcorrencia")
    public @ResponseBody String getCarregarOcorrencia(@DateTimeFormat(pattern = "dd/MM/yyyy") Date dataOcorrencia) 
            throws JsonProcessingException {
        
        ObjectMapper mapper = new ObjectMapper();
        
        try {
            return mapper.writeValueAsString(ocorrenciaService.filtrar(0, 0, dataOcorrencia));
        } catch (JsonProcessingException e) {
            throw e;
        }
    }
    
    @RequestMapping("/salvar")
    public @ResponseBody String salvar(int id, int idRequerente, int idOcorrencia) {
     
        if(service.salvar(id, idRequerente, idOcorrencia) == null) {
            return RespostaJson.objectToJson(RespostaJson.MSG_ERRO, 
                    "Já existe um protocolo cadastrado para este este requerente e ocorrência");
        }
        
        return RespostaJson.objectToJson(RespostaJson.MSG_SUCESSO, 
                    "Operação realizada com sucesso!");
    }    

    @RequestMapping("/filtrar")
    public String filtrar(String cpfRequerente, String codigoAutenticacao, Model model) {
        
        model.addAttribute("protocolos", service.filtrar(cpfRequerente, codigoAutenticacao));
        model.addAttribute("msgConsulta", "Não foram encontrados dados para esta consulta.");
        model.addAttribute("cpfRequerenteFiltro", cpfRequerente);
        model.addAttribute("cdAutenticacaoFiltro", codigoAutenticacao);
        
        return "lista-protocolo";
    }
    
    @RequestMapping("/remover")
    public @ResponseBody String remover(Protocolo protocolo) {
        service.deletar(protocolo);

        return "Protocolo removido com sucesso.";
    }
    
    @RequestMapping("/autenticar")
    public @ResponseBody String autenticar(String cdAuntenticacao) {
        Protocolo protocolo = service.autenticar(cdAuntenticacao);
        
        if(protocolo == null) {
            return "";
        }
        
        return RespostaJson.objectToJson(protocolo);
    }
            
}
