package iut.sae.saeconnectback.entities;

import iut.sae.saeconnectback.dtos.GroupDTO;
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

    private String password;

    private Long roleId;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "groupes_etudiants"
            , joinColumns = @JoinColumn(name = "etudiant_id")
            , inverseJoinColumns = @JoinColumn(name = "groupe_id"))
    private List<Group> groups;


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
