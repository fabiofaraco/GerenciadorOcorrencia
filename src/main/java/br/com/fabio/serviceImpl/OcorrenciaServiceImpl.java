package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.TipoGrupamento;
import br.com.fabio.entity.NaturezaEvento;
import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.repository.CidadeRepository;
import br.com.fabio.repository.EstadoRepository;
import br.com.fabio.repository.NaturezaEventoRepository;
import br.com.fabio.repository.OcorrenciaRepository;
import br.com.fabio.service.OcorrenciaService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import br.com.fabio.repository.TipoGrupamentoRepository;

@Service
public class OcorrenciaServiceImpl implements OcorrenciaService {

    @Autowired
    private OcorrenciaRepository ocorrenciaRepository;
    @Autowired
    private NaturezaEventoRepository naturezaEventoRepository;
    @Autowired
    private TipoGrupamentoRepository grupamentoRepository;
    @Autowired
    private EstadoRepository estadoRepository;
    @Autowired
    private CidadeRepository cidadeRepository;

    @Override
    public List<NaturezaEvento> getListaNaturezasEvento() {
        return naturezaEventoRepository
                .findAll(new Sort(Sort.Direction.ASC, "descricao"));
    }

    @Override
    public List<Estado> getListaEstados() {
        return estadoRepository.findAll(new Sort(Sort.Direction.ASC, "sigla"));
    }

    @Override
    public List<Cidade> getListaCidadesByIdEstado(int id) {
        return cidadeRepository.findByEstadoIdOrderByNome(id);
    }

    @Override
    public NaturezaEvento getNaturezaEventoById(int id) {
        return naturezaEventoRepository.findById(id);
    }

    @Override
    public Ocorrencia getOcorrenciaById(int id) {
        return ocorrenciaRepository.findById(id);
    }

    @Override
    public Ocorrencia salvar(Ocorrencia ocorrencia) {
        return ocorrenciaRepository.save(ocorrencia);
    }

    @Override
    public void deletar(Ocorrencia ocorrencia) {
        ocorrenciaRepository.delete(ocorrencia);
    }

    @Override
    public List<Ocorrencia> filtrar(int id, int idNatureza, Date dataOcorrencia) {

        return ocorrenciaRepository.findByIdAndNaturezaIdAndDataOcorrencia(
                id, idNatureza, dataOcorrencia);
    }

    @Override
    public List<Ocorrencia> filtrarNaturezaEventoPeriodo(
            Date dtInicio,
            Date dtFim,
            int nrGrupamento,
            int grupamento) {
        return ocorrenciaRepository.findByNaturezaEventoPeriodo(
                dtInicio,
                dtFim,
                nrGrupamento,
                grupamento);
    }

    @Override
    public List<TipoGrupamento> getListaGrupamentos() {
        return grupamentoRepository.
                findAll(new Sort(Sort.Direction.ASC, "descricao"));
    }

    @Override
    public TipoGrupamento findTipoGrupamentoById(int id) {
        return grupamentoRepository.findTipoGrupamentoById(id);
    }
}
