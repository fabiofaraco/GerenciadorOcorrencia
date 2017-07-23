package br.com.fabio.service;

import br.com.fabio.entity.Usuario;
import java.util.List;

public interface UsuarioService {
    
    public Usuario findById(int id);
    
    public Usuario findByEmail(String email);
    
    public Usuario buscarPorCpf(String cpf, int id);
    
    public List<Usuario> findByNomeOrCpf(String nomeFiltro, String cpfFiltro);
    
    public void deletar(Usuario usuario);
    
    public void salvar(Usuario usuario);
    
    public int emailRedefinirSenha(String email);
}
