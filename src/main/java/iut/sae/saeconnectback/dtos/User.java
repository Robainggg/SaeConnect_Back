package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "users")
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String firstname;

    private String lastname;

    private String alias;

    @JsonIgnore
    private String password;

    private Long roleId;

    @OneToMany(mappedBy = "etudiant", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<GroupStudentDto> groupStudents;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", alias='" + alias + '\'' +
                ", password='" + password + '\'' +
                ", role_id=" + roleId +
                '}';
    }


}
