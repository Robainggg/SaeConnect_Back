package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.entities.User;
import iut.sae.saeconnectback.services.UserService;
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
@RequestMapping("/users")
public class UserController {
private final UserService userService;

public UserController(UserService userService){this.userService = userService;}

    @GetMapping("/{alias}")
    public ResponseEntity<?> userByAlias(@PathVariable String alias){
        Optional<User> user = userService.getUserByAlias(alias);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.noContent().build());
    }


    @GetMapping
    public ResponseEntity<?> allUsers(){
        List<User> users = userService.getAllUsers();

        System.out.println(users.toString());
        return ResponseEntity.ok(users);
    }

    @GetMapping("/responsables")
    public ResponseEntity<?> responsables(){
        List<User> users = userService.getResponsables();
        return ResponseEntity.ok(users);
    }

    @GetMapping("/etudiants")
    public ResponseEntity<?> etudiants(){
        List<User> users = userService.getEtudiants();
        return ResponseEntity.ok(users);
    }
}
