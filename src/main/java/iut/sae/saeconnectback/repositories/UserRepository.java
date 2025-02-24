package iut.sae.saeconnectback.repositories;

import iut.sae.saeconnectback.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByAlias(String alias);

    @Query("SELECT DISTINCT u FROM User u WHERE u.roleId = 1")
    List<User> findEtudiants();

    @Query("SELECT DISTINCT u FROM User u WHERE u.roleId = 2")
    List<User> findResponsables();
}
