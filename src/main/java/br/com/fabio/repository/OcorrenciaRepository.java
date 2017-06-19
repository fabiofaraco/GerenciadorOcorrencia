package br.com.fabio.repository;

import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.query.QueryOcorrencia;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OcorrenciaRepository extends JpaRepository<Ocorrencia, Long> {

    public Ocorrencia findById(int id);

    @Query(QueryOcorrencia.FILTRAR_POR_ID_E_NATUREZA_E_DATA_OCORRENCIA)
    public List<Ocorrencia> findByIdAndNaturezaIdAndDataOcorrencia(
            int id, int idNatureza, Date dataOcorrencia);
}
