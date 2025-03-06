package iut.sae.saeconnectback.controllers;


import iut.sae.saeconnectback.dtos.CreateSaeDTO;
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

    @GetMapping("/{id}")
    public ResponseEntity<?> saeById(@PathVariable final Long id){
        return ResponseEntity.ok(this.saeService.getSaeById(id));
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody final CreateSaeDTO createSaeDto){
        try {
            System.out.println(createSaeDto.toString());
            this.saeService.save(createSaeDto);
            return ResponseEntity.ok().body(createSaeDto);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
