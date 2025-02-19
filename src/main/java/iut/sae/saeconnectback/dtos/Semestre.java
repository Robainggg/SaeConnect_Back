package iut.sae.saeconnectback.dtos;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "semestres")
public class Semestre {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nom;

}
