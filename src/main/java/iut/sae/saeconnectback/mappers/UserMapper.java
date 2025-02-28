package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.AuthLoginRequestDTO;
import iut.sae.saeconnectback.dtos.AuthLoginResponseDTO;
import iut.sae.saeconnectback.dtos.AuthRegisterRequestDTO;
import iut.sae.saeconnectback.dtos.UserDTO;
import iut.sae.saeconnectback.entities.Group;
import iut.sae.saeconnectback.entities.Role;
import iut.sae.saeconnectback.entities.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
public class UserMapper {

    public static UserDTO toDto(User user){
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setFirstname(user.getFirstname());
        userDTO.setLastname(user.getLastname());
        userDTO.setAlias(user.getAlias());
        userDTO.setPassword(user.getPassword());
        userDTO.setRole(user.getRole());
        if(user.getGroups() != null)
            userDTO.setGroupIds(user.getGroups().stream().map(Group::getId).collect(Collectors.toList()));

        return userDTO;
    }

    public static User toEntity(UserDTO userDTO, List<Group> groups){
        User user = new User();
        user.setId(userDTO.getId());
        user.setFirstname(userDTO.getFirstname());
        user.setLastname(userDTO.getLastname());
        user.setAlias(userDTO.getAlias());
        user.setGroups(groups);
        user.setPassword(userDTO.getPassword());
        user.setRole(userDTO.getRole());
        return user;
    }

    public static User toEntity(AuthRegisterRequestDTO registerRequestDTO, Role role){
        User user = new User();
        user.setFirstname(registerRequestDTO.getFirstname());
        user.setLastname(registerRequestDTO.getLastname());
        user.setPassword(registerRequestDTO.getPassword());
        user.setRole(role);
        return user;
    }

    public static User toEntity(AuthLoginRequestDTO loginRequestDTO){
        User user = new User();
        user.setAlias(loginRequestDTO.getAlias());
        user.setPassword(loginRequestDTO.getPassword());
        return user;
    }

    public static AuthLoginResponseDTO toDTO(User user, String token, int expirationToken){
        AuthLoginResponseDTO authLoginResponseDTO = new AuthLoginResponseDTO();
        authLoginResponseDTO.setToken(token);
        authLoginResponseDTO.setRoleId(user.getRole().getId());
        authLoginResponseDTO.setFirstname(user.getFirstname());
        authLoginResponseDTO.setLastname(user.getLastname());
        authLoginResponseDTO.setExpires_in(expirationToken);
        return authLoginResponseDTO;
    }
}
