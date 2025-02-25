package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.SaeDTO;
import iut.sae.saeconnectback.entities.Sae;
import iut.sae.saeconnectback.mappers.SaeMapper;
import iut.sae.saeconnectback.repositories.SaeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaeService {
    private final SaeRepository saeRepository;

    public SaeService(SaeRepository saeRepository) {this.saeRepository = saeRepository;}

    public List<SaeDTO> getAllSaes() {
        List<Sae> saes = saeRepository.findAll();
        return saes.stream().map(SaeMapper::toDto).toList();
    }

    public void save(SaeDTO saeDTO) {
        Sae sae = SaeMapper.toEntity(saeDTO);
        saeRepository.save(sae);
    }
}
