package br.com.fabio.repository;

import br.com.fabio.entity.Usuario;
import br.com.fabio.query.QueryUsuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    public Usuario findById(int id);
    
    public Usuario findByEmail(String email);
    
    @Query(QueryUsuario.BUSCAR_USUARIO_CPF)
    public Usuario buscarPorCpf(String cpf, int id);
        
    @Query(QueryUsuario.FILTRAR_POR_NOME_OU_CPF)
    public List<Usuario> findByNomeOrCpf(String nomeFiltro, String cpfFiltro);
}
