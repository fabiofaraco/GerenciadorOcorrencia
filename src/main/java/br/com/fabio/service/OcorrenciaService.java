package br.com.fabio.service;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.NaturezaEvento;
import br.com.fabio.entity.Ocorrencia;
import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Sort;

public interface OcorrenciaService extends EnderecoService {

    public List<NaturezaEvento> getListaNaturezasEvento();

    public NaturezaEvento getNaturezaEventoById(int id);

    public Ocorrencia getOcorrenciaById(int id);

    public Ocorrencia salvar(Ocorrencia ocorrencia);

    public void deletar(Ocorrencia ocorrencia);

    public List<Ocorrencia> filtrar(int id, int idNatureza, Date dataOcorrencia);
    
    public List<Ocorrencia> filtrarNaturezaEventoPeriodo(Date dtInicio, Date dtFim);
}
