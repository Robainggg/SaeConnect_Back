package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.Semestre;
import iut.sae.saeconnectback.dtos.User;
import iut.sae.saeconnectback.services.SemestreService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/semestres")
public class SemestreController {

    private final SemestreService semestreService;

    public SemestreController(final SemestreService semestreService) {
        this.semestreService = semestreService;
    }

    @GetMapping()
    public ResponseEntity<?> semestres(){
        List<Semestre> semestres = semestreService.getAllSemestres();
        return ResponseEntity.ok(semestres);
    }
}
