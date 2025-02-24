package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.entities.Group;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GroupRepository extends JpaRepository<Group, Long> {
}
