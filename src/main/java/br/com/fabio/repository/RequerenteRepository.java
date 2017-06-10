package br.com.fabio.repository;

import br.com.fabio.entity.Requerente;
import br.com.fabio.entity.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RequerenteRepository extends JpaRepository<Requerente, Long> {

    public Requerente findById(int id);
    
    @Query("select r from Requerente r \n"
            + "where upper(r.nome) like \n"
            + "case when ?1 <> '' then concat('%', upper(?1), '%') \n"
            + "     else concat('%', upper(r.nome), '%') end \n"
            + "and upper(r.cpf) = \n"
            + "case when ?2 <> '' then ?2 \n"
            + "     else upper(r.cpf) end "
            + "order by r.nome\n")
    public List<Requerente> findByNomeOrCpf(String nomeFiltro, String cpfFiltro);
    
    @Query("select r from Requerente r where r.cpf = ?1 and r.id <> ?2")
    public Requerente buscarPorCpf(String cpf, int id);
}
