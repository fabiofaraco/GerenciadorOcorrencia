package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.NaturezaEvento;
import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.repository.CidadeRepository;
import br.com.fabio.repository.EstadoRepository;
import br.com.fabio.repository.NaturezaEventoRepository;
import br.com.fabio.repository.OcorrenciaRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class OcorrenciaServiceImpl {

    @Autowired
    private OcorrenciaRepository ocorrenciaRepository;
    @Autowired
    private NaturezaEventoRepository naturezaEventoRepository;
    @Autowired
    private EstadoRepository estadoRepository;
    @Autowired
    private CidadeRepository cidadeRepository;

    public List<NaturezaEvento> getListaNaturezasEvento() {
        return naturezaEventoRepository
                .findAll(new Sort(Sort.Direction.ASC, "descricao"));
    }

    public List<Estado> getListaEstados() {
        return estadoRepository.findAll(new Sort(Sort.Direction.ASC, "sigla"));
    }

    public List<Cidade> getListaCidadesByIdEstado(int id) {
        return cidadeRepository.findByEstadoIdOrderByNome(id);
    }

    public NaturezaEvento getNaturezaEventoById(int id) {
        return naturezaEventoRepository.findById(id);
    }

    public Ocorrencia getOcorrenciaById(int id) {
        return ocorrenciaRepository.findById(id);
    }

    public Ocorrencia salvar(Ocorrencia ocorrencia) {
        return ocorrenciaRepository.save(ocorrencia);
    }

    public void deletar(Ocorrencia ocorrencia) {
        ocorrenciaRepository.delete(ocorrencia);
    }

    public List<Ocorrencia> filtrar(int id, int idNatureza, Date dataOcorrencia) {

        return ocorrenciaRepository.findByIdAndNaturezaIdAndDataOcorrencia(
                id, idNatureza, dataOcorrencia);
    }
    
    private Date parseDate(String data) 
    {
        SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat frmtNew = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            return frmt.parse(data);
        } catch(Exception e) {
            return null;
        }
    }
}
