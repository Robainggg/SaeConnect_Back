package iut.sae.saeconnectback.controllers;


import iut.sae.saeconnectback.dtos.SaeDto;
import iut.sae.saeconnectback.services.SaeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping
    public ResponseEntity<?> save(@RequestBody final SaeDto saeDto){
        try {
            this.saeService.save(saeDto);
            return ResponseEntity.ok().body(saeDto);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
