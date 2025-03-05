package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.SoutenanceDTO;
import iut.sae.saeconnectback.entities.Soutenance;

public class SoutenanceMapper {

    public static SoutenanceDTO toDto(Soutenance soutenance) {
        SoutenanceDTO soutenanceDTO = new SoutenanceDTO();
        soutenanceDTO.setId(soutenance.getId());
        soutenanceDTO.setIdSae(soutenance.getIdSae());
        soutenanceDTO.setDate(soutenance.getDate());
        soutenanceDTO.setLieu(soutenance.getLieu());
        return soutenanceDTO;
    }

    public static Soutenance toEntity(SoutenanceDTO soutenanceDTO) {
        Soutenance soutenance = new Soutenance();
        soutenance.setId(soutenanceDTO.getId());
        soutenance.setIdSae(soutenanceDTO.getIdSae());
        soutenance.setDate(soutenanceDTO.getDate());
        soutenance.setLieu(soutenanceDTO.getLieu());
        return soutenance;
    }
}
