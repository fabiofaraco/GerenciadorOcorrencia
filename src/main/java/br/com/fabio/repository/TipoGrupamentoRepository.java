package br.com.fabio.repository;

import br.com.fabio.entity.TipoGrupamento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TipoGrupamentoRepository extends JpaRepository<TipoGrupamento, Long> {
    
    public TipoGrupamento findTipoGrupamentoById(int id);
}
