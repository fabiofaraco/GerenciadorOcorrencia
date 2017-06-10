package br.com.fabio.repository;

import br.com.fabio.entity.Perfil;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerfilRepository extends JpaRepository<Perfil, Long>{
    
}
