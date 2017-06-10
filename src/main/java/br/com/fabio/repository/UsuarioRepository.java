package br.com.fabio.repository;

import br.com.fabio.entity.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    public Usuario findById(int id);
    
    @Query("select u from Usuario u where u.cpf = ?1 and u.id <> ?2")
    public Usuario buscarPorCpf(String cpf, int id);
        
    @Query("select u from Usuario u \n"
            + "where upper(u.nome) like \n"
            + "case when ?1 <> '' then concat('%', upper(?1), '%') \n"
            + "     else concat('%', upper(u.nome), '%') end \n"
            + "and upper(u.cpf) = \n"
            + "case when ?2 <> '' then ?2 \n"
            + "     else upper(u.cpf) end "
            + "order by u.nome\n")
    public List<Usuario> findByNomeOrCpf(String nomeFiltro, String cpfFiltro);
}
