package iut.sae.saeconnectback.dtos;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "groupes_etudiants")
public class GroupStudentDto {
    @Id
    private Long groupe_id;

    @Id
    private Long etudiant_id;
}
