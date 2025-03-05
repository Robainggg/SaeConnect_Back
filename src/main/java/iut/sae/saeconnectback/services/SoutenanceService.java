package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.SoutenanceDTO;
import iut.sae.saeconnectback.entities.Soutenance;
import iut.sae.saeconnectback.mappers.SoutenanceMapper;
import iut.sae.saeconnectback.repositories.SoutenanceRepository;

import java.util.List;
import java.util.Optional;

public class SoutenanceService {

    private final SoutenanceRepository soutenanceRepository;

    public SoutenanceService(SoutenanceRepository soutenanceRepository) {
        this.soutenanceRepository = soutenanceRepository;
    }

    public List<SoutenanceDTO> getAllSoutenance() {
        List<Soutenance> soutenance = soutenanceRepository.findAll();
        return soutenance.stream().map(SoutenanceMapper::toDto).toList();
    }

    public Optional<Soutenance> getSoutenanceById(Long id){
        return soutenanceRepository.findById(id);
    }

}

