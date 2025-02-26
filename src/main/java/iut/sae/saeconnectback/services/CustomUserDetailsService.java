package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.repositories.UserRepository;
import iut.sae.saeconnectback.entities.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;


@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> userOptional = userRepository.findByAlias(username);

        if (userOptional.isEmpty()) {
            throw new UsernameNotFoundException("Utilisateur non trouvé avec l'alias: " + username);
        }
        User user = userOptional.get();
        return new org.springframework.security.core.userdetails.User(user.getAlias(), user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole().getNom())));
    }
}