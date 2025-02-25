package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.SaeDTO;
import iut.sae.saeconnectback.entities.Sae;

public class SaeMapper {
    public static SaeDTO toDto(Sae sae) {
        SaeDTO dto = new SaeDTO();
        dto.setId(sae.getId());
        dto.setSujet(sae.getSujet());
        dto.setNom(sae.getNom());
        dto.setSemestreId(sae.getSemestreId());
        dto.setResponsableId(sae.getResponsableId());
        return dto;
    }

    public static Sae toEntity(SaeDTO dto) {
        Sae sae = new Sae();
        sae.setId(dto.getId());
        sae.setSujet(dto.getSujet());
        sae.setNom(dto.getNom());
        sae.setSemestreId(dto.getSemestreId());
        sae.setResponsableId(dto.getResponsableId());
        return sae;
    }
}
