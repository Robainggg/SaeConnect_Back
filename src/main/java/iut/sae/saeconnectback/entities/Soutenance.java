package iut.sae.saeconnectback.entities;


import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Entity
@Table(name = "soutenance")
@AllArgsConstructor
@NoArgsConstructor
public class Soutenance {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonProperty(value = "sae_id")
    private Long idSae;

    private Date date;

    private String lieu;
}
