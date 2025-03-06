package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.CreateSaeDTO;
import iut.sae.saeconnectback.entities.Sae;

public class SaeMapper {
    public static CreateSaeDTO toDto(Sae sae) {
        CreateSaeDTO dto = new CreateSaeDTO();
        dto.setId(sae.getId());
        dto.setSujet(sae.getSujet());
        dto.setNom(sae.getNom());
        dto.setSemestreId(sae.getSemestreId());
        dto.setResponsableId(sae.getResponsableId());
        return dto;
    }

    public static Sae toEntity(CreateSaeDTO dto) {
        Sae sae = new Sae();
        sae.setId(dto.getId());
        sae.setSujet(dto.getSujet());
        sae.setNom(dto.getNom());
        sae.setSemestreId(dto.getSemestreId());
        sae.setResponsableId(dto.getResponsableId());
        return sae;
    }
}
