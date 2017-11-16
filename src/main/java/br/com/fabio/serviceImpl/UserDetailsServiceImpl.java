package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Usuario;
import br.com.fabio.repository.UsuarioRepository;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByEmail(email);

        if (usuario == null) {
            throw new UsernameNotFoundException("Usuário não existe");
        } else {
            Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_"
                    + usuario.getPerfil().getDescricao().toUpperCase()));

            return new User(usuario.getEmail(), usuario.getSenha(),
                    grantedAuthorities);
        }
    }

}
