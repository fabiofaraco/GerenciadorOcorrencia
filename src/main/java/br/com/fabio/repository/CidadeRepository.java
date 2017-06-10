package br.com.fabio.repository;

import br.com.fabio.entity.Cidade;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CidadeRepository extends JpaRepository<Cidade, Long> { 
 
    public List<Cidade> findByEstadoIdOrderByNome(int idEstado);
}
