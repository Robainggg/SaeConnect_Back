package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.SemesterDTO;
import iut.sae.saeconnectback.services.SemesterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/semesters")
public class SemesterController {

    private final SemesterService semesterService;

    public SemesterController(final SemesterService semesterService) {
        this.semesterService = semesterService;
    }

    @GetMapping()
    public ResponseEntity<?> semestres(){
        List<SemesterDTO> semestres = semesterService.getAllSemestres();
        return ResponseEntity.ok(semestres);
    }
}
