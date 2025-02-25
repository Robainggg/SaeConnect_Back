package iut.sae.saeconnectback.entities;


import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "saes")
@AllArgsConstructor
@NoArgsConstructor
public class Sae {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nom;

    private String sujet;

    @JsonProperty(value = "responsable_id")
    private Long responsableId;

    @JsonProperty(value = "semestre_id")
    private Long semestreId;

}
