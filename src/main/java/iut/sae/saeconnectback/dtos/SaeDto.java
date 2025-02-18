package iut.sae.saeconnectback.dtos;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "saes")
public class SaeDto {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nom;

    private String sujet;

    private Long responsableId;

    private Long semestreId;
}
