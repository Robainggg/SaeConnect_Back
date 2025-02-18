package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.User;
import iut.sae.saeconnectback.repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    UserRepository userRepository;

    public UserService(UserRepository userRepository){this.userRepository = userRepository;}

    public Optional<User> getUserByAlias(String alias){
        return userRepository.findByAlias(alias);

    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public List<User> getResponsables(){return userRepository.findResponsables();}

    public List<User> getEtudiants(){return userRepository.findEtudiants();}
}
