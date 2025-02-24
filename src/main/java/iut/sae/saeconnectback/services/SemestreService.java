package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.entities.Semestre;
import iut.sae.saeconnectback.repositories.SemestreRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SemestreService {

    private final SemestreRepository semestreRepository;

    public SemestreService(SemestreRepository semestreRepository) {
        this.semestreRepository = semestreRepository;
    }

    public List<Semestre> getAllSemestres() {
        return semestreRepository.findAll();
    }
}
