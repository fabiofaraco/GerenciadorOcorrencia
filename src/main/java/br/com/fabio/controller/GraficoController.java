package br.com.fabio.controller;

import br.com.fabio.entity.TipoGrupamento;
import br.com.fabio.propertyEditor.TipoGrupamentoPropertyEditor;
import br.com.fabio.service.OcorrenciaService;
import br.com.fabio.util.Grafico;
import java.text.SimpleDateFormat;
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
@RequestMapping("grafico")
public class GraficoController {

    @Autowired
    private OcorrenciaService ocorrenciaService;

    @InitBinder
    public void customizeBinding(WebDataBinder binder) {
        binder.registerCustomEditor(TipoGrupamento.class, new TipoGrupamentoPropertyEditor());
    }

    @RequestMapping("filtro")
    public String getForm(Model model) {
        model.addAttribute("grupamentos", ocorrenciaService.getListaGrupamentos());

        return "grafico";
    }

    @RequestMapping("filtroNaturezaPeriodo")
    public @ResponseBody
    String getFiltroOcorrenciaMes(
            @DateTimeFormat(pattern = "dd/MM/yyyy") Date dtInicio,
            @DateTimeFormat(pattern = "dd/MM/yyyy") Date dtFim,
            int nrGrupamento,
            int grupamento,
            String tipoGrafico) {

        SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");

        String dataInicial = frmt.format(dtInicio);
        String dataFim = frmt.format(dtFim);
        TipoGrupamento tipoGrupamento = ocorrenciaService.findTipoGrupamentoById(grupamento);

        String title = "Ocorrência por Natureza do Evento no " + nrGrupamento + "ª "
                + tipoGrupamento.getDescricao()
                +" em "
                + dataInicial + " até "
                + dataFim;
        
        Grafico grafico = new Grafico(title,
                tipoGrafico,
                ocorrenciaService.filtrarNaturezaEventoPeriodo(dtInicio, dtFim, nrGrupamento, grupamento));

        return grafico.convertGraphicToJson();
    }
}
