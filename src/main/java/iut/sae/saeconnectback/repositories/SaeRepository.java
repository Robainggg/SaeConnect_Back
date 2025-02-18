package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.dtos.SaeDto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SaeRepository extends JpaRepository<SaeDto, Long> {
}
