package iut.sae.saeconnectback.entities;


import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "groupes")
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nom;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "groupes_etudiants"
            , joinColumns = @JoinColumn(name = "groupe_id")
            , inverseJoinColumns = @JoinColumn(name = "etudiant_id"))
    private List<User> users;

    @Override
    public String toString() {
        return "Group{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }
}











