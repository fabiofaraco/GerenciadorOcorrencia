package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import br.com.fabio.entity.Requerente;
import br.com.fabio.repository.CidadeRepository;
import br.com.fabio.repository.EstadoRepository;
import br.com.fabio.repository.RequerenteRepository;
import br.com.fabio.service.RequerenteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class RequerenteServiceImpl implements RequerenteService {

    @Autowired
    private RequerenteRepository requerenteRepository;
    @Autowired
    private EstadoRepository estadoRepository;
    @Autowired
    private CidadeRepository cidadeRepository;

    @Override
    public List<Estado> getListaEstados() {
        
        return estadoRepository.findAll(new Sort(Sort.Direction.ASC, "sigla"));
    }

    @Override
    public List<Cidade> getListaCidadesByIdEstado(int id) {
        
        return cidadeRepository.findByEstadoIdOrderByNome(id);
    }

    @Override
    public Requerente buscarPorId(int id) {
        
        return requerenteRepository.findById(id);
    }

    @Override
    public Requerente buscarPorCpf(String cpf, int id) {
        
        return requerenteRepository.buscarPorCpf(cpf, id);
    }
    
    @Override
    public List<Requerente> getListaPorNomeOuCpf(String nome, String cpf) {
        
        return requerenteRepository.findByNomeOrCpf(nome, cpf);
    }

    @Override
    public Requerente salvar(Requerente requerente) {
        
        return requerenteRepository.save(requerente);
    }

    @Override
    public void deletar(Requerente requerente) {
        try {
            requerenteRepository.delete(requerente);
        } catch (RuntimeException ex) {
            throw ex;
        }
        
    }

}
