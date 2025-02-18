package iut.sae.saeconnectback.dtos;

import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class CoResponsibleId implements Serializable {

    public Long sae_id;

    public Long responsable_id;
}
