package br.com.fabio.service;

import br.com.fabio.entity.Protocolo;
import java.util.List;

public interface ProtocoloService {

    public Protocolo findById(int id);
    
    public Protocolo salvar(int id, int idRequerente, int idOcorrencia);
    
    public List<Protocolo> filtrar(String cpfRequerente, String condigoAutenticacao);
    
    public void deletar(Protocolo protocolo);
    
    public Protocolo autenticar(String cdAutenticacao);
}
