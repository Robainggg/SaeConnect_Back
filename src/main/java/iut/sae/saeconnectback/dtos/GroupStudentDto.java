package iut.sae.saeconnectback.dtos;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "groupes_etudiants")
public class GroupStudentDto {

    @EmbeddedId
    private GroupStudentId groupStudentId;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("groupeId")
    @JoinColumn(name = "groupe_id")
    @JsonBackReference("groupe-reference")
    private GroupDto groupe;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("etudiantId")
    @JoinColumn(name = "etudiant_id")
    @JsonBackReference("etudiant-reference")
    private User etudiant;

    @JsonProperty("etudiant_id") // Sérialise uniquement l'id de l'étudiant
    public Long getStudentId() {
        return this.etudiant != null ? this.etudiant.getId() : null;
    }

}
