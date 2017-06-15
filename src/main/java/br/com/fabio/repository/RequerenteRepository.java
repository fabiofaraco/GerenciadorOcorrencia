package br.com.fabio.repository;

import br.com.fabio.entity.Requerente;
import br.com.fabio.query.QueryRequerente;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RequerenteRepository extends JpaRepository<Requerente, Long> {

    public Requerente findById(int id);
    
    @Query(QueryRequerente.BUSCAR_REQUERENTE_CPF)
    public Requerente buscarPorCpf(String cpf, int id);
    
    @Query(QueryRequerente.FILTRAR_POR_NOME_OU_CPF)
    public List<Requerente> findByNomeOrCpf(String nomeFiltro, String cpfFiltro);
}
