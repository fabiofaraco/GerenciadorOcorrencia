package br.com.fabio.repository;

import br.com.fabio.entity.NaturezaEvento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NaturezaEventoRepository extends JpaRepository<NaturezaEvento, Long> {

    public NaturezaEvento findById(int id);
}
