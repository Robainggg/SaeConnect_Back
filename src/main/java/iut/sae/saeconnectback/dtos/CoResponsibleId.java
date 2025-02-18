package iut.sae.saeconnectback.dtos;

import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class CoResponsibleId implements Serializable {

    public Long saeId;

    public Long responsableId;
}
