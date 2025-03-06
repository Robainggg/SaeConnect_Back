package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.SoutenanceDTO;
import iut.sae.saeconnectback.entities.User;
import iut.sae.saeconnectback.services.SoutenanceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

public class SoutenanceController {

    private final SoutenanceService soutenanceService;

    public SoutenanceController(final SoutenanceService soutenanceService) {
        this.soutenanceService = soutenanceService;
    }

    @GetMapping()
    public ResponseEntity<?> soutenances(){
        List<SoutenanceDTO> soutenance = soutenanceService.getAllSoutenance();
        return ResponseEntity.ok(soutenance);
    }


}
