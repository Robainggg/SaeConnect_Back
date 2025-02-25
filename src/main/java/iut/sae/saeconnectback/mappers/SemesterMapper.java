package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.SemesterDTO;
import iut.sae.saeconnectback.entities.Semestre;

public class SemesterMapper {
    public static SemesterDTO toDto(Semestre semestre) {
        SemesterDTO semesterDTO = new SemesterDTO();
        semesterDTO.setId(semestre.getId());
        semesterDTO.setNom(semestre.getNom());
        return semesterDTO;
    }

    public static Semestre toEntity(SemesterDTO semesterDTO) {
        Semestre semestre = new Semestre();
        semestre.setId(semesterDTO.getId());
        semestre.setNom(semesterDTO.getNom());
        return semestre;
    }
}
