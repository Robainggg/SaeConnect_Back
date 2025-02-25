package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.UserDTO;
import iut.sae.saeconnectback.entities.User;
import iut.sae.saeconnectback.mappers.UserMapper;
import iut.sae.saeconnectback.repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {
    UserRepository userRepository;

    public UserService(UserRepository userRepository){this.userRepository = userRepository;}

    public Optional<User> getUserByAlias(String alias){
        return userRepository.findByAlias(alias);

    }

    public Optional<User> getUserById(Long id){
        return userRepository.findById(id);
    }

    public List<UserDTO> getAllUsers(){
        List<User> users = userRepository.findAll();
        return users.stream().map(UserMapper::toDto).collect(Collectors.toList());
    }

    public List<User> getResponsables(){return userRepository.findResponsables();}

    public List<User> getEtudiants(){return userRepository.findEtudiants();}
}
