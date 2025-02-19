package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.dtos.Semestre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SemestreRepository extends JpaRepository<Semestre, Long> {
}
