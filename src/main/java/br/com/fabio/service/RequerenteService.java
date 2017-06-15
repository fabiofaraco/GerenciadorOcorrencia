package br.com.fabio.service;

import br.com.fabio.entity.Requerente;
import java.util.List;

public interface RequerenteService extends EnderecoService {
    
    public Requerente buscarPorId(int id);

    public Requerente buscarPorCpf(String cpf, int id);
    
    public List<Requerente> getListaPorNomeOuCpf(String nome, String cpf);
    
    public Requerente salvar(Requerente requerente);
    
    public void deletar(Requerente requerente);
}
