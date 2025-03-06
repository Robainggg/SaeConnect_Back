package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class CreateSaeDTO {

    private Long id;

    private String nom;

    private String sujet;

    @JsonProperty(value = "responsable_id")
    private Long responsableId;

    @JsonProperty(value = "semestre_id")
    private Long semestreId;



}
