package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.entities.Semestre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SemesterRepository extends JpaRepository<Semestre, Long> {
}
