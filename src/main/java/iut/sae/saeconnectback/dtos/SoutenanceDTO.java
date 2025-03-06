package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.Date;
import java.util.Optional;

@Data
public class SoutenanceDTO {

        private Long id;

    @JsonProperty(value = "sae_id")
    private Long idSae;

    private Date date;

    private String lieu;


}
