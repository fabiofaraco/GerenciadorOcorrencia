package br.com.fabio.repository;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.query.QueryProtocolo;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProtocoloRepository extends JpaRepository<Protocolo, Long> {

    public Protocolo findById(int id);
    
    public Protocolo findByRequerenteIdAndOcorrenciaId(int idRequerente, int idOcorrencia);
    
    @Query(QueryProtocolo.FILTRAR_POR_REQUERENTE_CPF_OU_CODIGO_AUTENTICACAO)
    public List<Protocolo> findByRequerenteCpfAndCodigoAutenticacao(
            String cpfRequerente, String condigoAutenticacao);
    
    public Protocolo findBycodigoAutenticacao(String codigoAutenticacao);
}
