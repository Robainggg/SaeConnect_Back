package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.CreateSaeDTO;
import iut.sae.saeconnectback.entities.Sae;
import iut.sae.saeconnectback.mappers.SaeMapper;
import iut.sae.saeconnectback.repositories.SaeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SaeService {
    private final SaeRepository saeRepository;

    public SaeService(SaeRepository saeRepository) {this.saeRepository = saeRepository;}

    public List<CreateSaeDTO> getAllSaes() {
        List<Sae> saes = saeRepository.findAll();
        return saes.stream().map(SaeMapper::toDto).toList();
    }

    public CreateSaeDTO getSaeById(Long id) {
        Optional<Sae> sae =  saeRepository.findById(id);
        return sae.map(SaeMapper::toDto).orElse(null);
    }

    public void save(CreateSaeDTO createSaeDTO) {
        Sae sae = SaeMapper.toEntity(createSaeDTO);
        saeRepository.save(sae);
    }
}
