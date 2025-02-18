package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.SaeDto;
import iut.sae.saeconnectback.repositories.SaeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaeService {
    private final SaeRepository saeRepository;

    public SaeService(SaeRepository saeRepository) {this.saeRepository = saeRepository;}

    public List<SaeDto> getAllSaes() {
        return saeRepository.findAll();
    }
}
