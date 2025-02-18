package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.dtos.GroupStudentDto;
import iut.sae.saeconnectback.dtos.GroupStudentId;
import iut.sae.saeconnectback.dtos.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface GroupStudentRepository extends JpaRepository<GroupStudentDto, GroupStudentId> {

    List<GroupStudentDto> findByGroupeId(Long groupeId);

}
