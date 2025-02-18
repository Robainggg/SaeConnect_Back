package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.dtos.GroupDto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GroupRepository extends JpaRepository<GroupDto, Long> {
}
