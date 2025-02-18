package iut.sae.saeconnectback.controllers;


import iut.sae.saeconnectback.dtos.SaeDto;
import iut.sae.saeconnectback.services.SaeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/saes")
public class SaeController {

    private final SaeService saeService;

    public SaeController(final SaeService saeService) {this.saeService = saeService;}

    @GetMapping
    public ResponseEntity<?> saes(){
        return ResponseEntity.ok(this.saeService.getAllSaes());
    }

}
