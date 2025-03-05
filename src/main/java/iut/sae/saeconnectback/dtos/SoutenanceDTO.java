package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.Date;

@Data
public class SoutenanceDTO {

    private int id;

    @JsonProperty(value = "sae_id")
    private Long idSae;

    private Date date;

    private String lieu;


}
