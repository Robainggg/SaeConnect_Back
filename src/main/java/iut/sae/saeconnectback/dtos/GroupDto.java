package iut.sae.saeconnectback.dtos;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "groupes")
public class GroupDto {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
}
