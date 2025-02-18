package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.GroupDto;
import iut.sae.saeconnectback.services.GroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/groupes")
public class GroupController {
    private final GroupService groupService;

    public GroupController(final GroupService groupService) { this.groupService = groupService; }


    @GetMapping
    public ResponseEntity<?> getAllGroups() {
        List<GroupDto> groups = this.groupService.getAllGroups();
        return ResponseEntity.ok().body(groups);
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody final GroupDto groupDto) {
        try {
            System.out.println(groupDto);
            this.groupService.save(groupDto);
            return ResponseEntity.ok().body(groupDto.toString());
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
