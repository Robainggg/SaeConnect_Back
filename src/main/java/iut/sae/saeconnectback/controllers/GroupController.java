package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.services.GroupService;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/groups")
public class GroupController {
    private final GroupService groupService;

    public GroupController(final GroupService groupService) { this.groupService = groupService; }


    @GetMapping
    @Transactional
    public ResponseEntity<?> getAllGroups() {
        List<GroupDTO> groups = this.groupService.getAllGroups();
        return ResponseEntity.ok().body(groups);
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody final GroupDTO groupDto) {
        try {
            System.out.println(groupDto);
            this.groupService.save(groupDto);
            return ResponseEntity.ok().body(groupDto.toString());
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/{groupId}/users")
    public ResponseEntity<?> addUsersToGroup(@PathVariable final Long groupId, @RequestBody final List<Long> userIds) {
        try{
            this.groupService.addUsersToGroup(groupId, userIds);
            return ResponseEntity.ok().build();
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
