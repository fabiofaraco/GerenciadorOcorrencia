package br.com.fabio.service;

import br.com.fabio.entity.TipoGrupamento;
import br.com.fabio.entity.NaturezaEvento;
import br.com.fabio.entity.Ocorrencia;
import java.util.Date;
import java.util.List;

public interface OcorrenciaService extends EnderecoService {

    public List<NaturezaEvento> getListaNaturezasEvento();
    
    public List<TipoGrupamento> getListaGrupamentos();

    public NaturezaEvento getNaturezaEventoById(int id);

    public Ocorrencia getOcorrenciaById(int id);

    public Ocorrencia salvar(Ocorrencia ocorrencia);

    public void deletar(Ocorrencia ocorrencia);

    public List<Ocorrencia> filtrar(int id, int idNatureza, Date dataOcorrencia);
    
    public TipoGrupamento findTipoGrupamentoById(int id);
    
    public List<Ocorrencia> filtrarNaturezaEventoPeriodo(
            Date dtInicio, 
            Date dtFim, 
            int nrGrupamento, 
            int grupamento);
}
