package br.com.fabio.controller;

import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.service.OcorrenciaService;
import br.com.fabio.util.Grafico;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("grafico")
public class GraficoController {

    @Autowired
    private OcorrenciaService ocorrenciaService;

    @RequestMapping("filtro")
    public String getForm() {
        return "grafico";
    }

    @RequestMapping("filtroNaturezaPeriodo")
    public @ResponseBody
    String getFiltroOcorrenciaMes(
            @DateTimeFormat(pattern = "dd/MM/yyyy") Date dtInicio,
            @DateTimeFormat(pattern = "dd/MM/yyyy") Date dtFim,
            String tipoGrafico) {

        String title = "Gráfico por Natureza do Evento";
        Grafico grafico = new Grafico(title,
                tipoGrafico,
                ocorrenciaService.filtrarNaturezaEventoPeriodo(dtInicio, dtFim));

        return grafico.convertGraphicToJson();
    }
}
