package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.SemesterDTO;
import iut.sae.saeconnectback.entities.Semestre;
import iut.sae.saeconnectback.mappers.SemesterMapper;
import iut.sae.saeconnectback.repositories.SemesterRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SemesterService {

    private final SemesterRepository semesterRepository;

    public SemesterService(SemesterRepository semesterRepository) {
        this.semesterRepository = semesterRepository;
    }

    public List<SemesterDTO> getAllSemestres() {
        List<Semestre> semestres = semesterRepository.findAll();
        return semestres.stream().map(SemesterMapper::toDto).toList();
    }
}
