package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "groupes")
public class GroupDto {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nom;

   @OneToMany(mappedBy = "groupe", cascade = CascadeType.ALL)
   @JsonManagedReference
   private List<GroupStudentDto> groupeStudents;


    @Override
    public String toString() {
        return "GroupDto{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }
}
