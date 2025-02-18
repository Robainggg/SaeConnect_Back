package iut.sae.saeconnectback.dtos;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class GroupStudentId {

    @Column(name = "groupe_id")
    private Long groupeId;

    @Column(name = "etudiant_id")
    private Long etudiantId;

}
