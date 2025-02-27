package iut.sae.saeconnectback.controllers;

import iut.sae.saeconnectback.dtos.AuthLoginRequestDTO;
import iut.sae.saeconnectback.dtos.AuthRegisterRequestDTO;
import iut.sae.saeconnectback.dtos.JwtResponse;
import iut.sae.saeconnectback.entities.Role;
import iut.sae.saeconnectback.entities.User;
import iut.sae.saeconnectback.mappers.UserMapper;
import iut.sae.saeconnectback.repositories.UserRepository;
import iut.sae.saeconnectback.services.RoleService;
import iut.sae.saeconnectback.utils.JwtTokenUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserRepository userRepository;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody AuthRegisterRequestDTO requestDTO) {
        System.out.println(requestDTO.toString());
        String alias = requestDTO.getFirstname().substring(0,1).toLowerCase() + requestDTO.getLastname().toLowerCase();
        if (userRepository.findByAlias(alias).isPresent()) {
            return ResponseEntity.badRequest().body("Cet utilisateur existe déjà");
        }

        requestDTO.setPassword(passwordEncoder.encode(requestDTO.getPassword()));

        Role role = roleService.getRoleById(requestDTO.getRoleId());

        User user = UserMapper.toEntity(requestDTO, role);

        userRepository.save(user);

        return ResponseEntity.ok(user);

    }

    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody AuthLoginRequestDTO user) {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getAlias(), user.getPassword()));
            String token = JwtTokenUtil.generateToken(user.getAlias());
            return ResponseEntity.ok(new JwtResponse(token));
        } catch(Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Alias ou mot de passe invalide");
        }
    }
}
