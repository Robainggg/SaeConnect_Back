package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.UserDTO;
import iut.sae.saeconnectback.entities.Group;
import iut.sae.saeconnectback.entities.User;

import java.util.List;
import java.util.stream.Collectors;

public class UserMapper {
    public static UserDTO toDto(User user){
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setFirstname(user.getFirstname());
        userDTO.setLastname(user.getLastname());
        userDTO.setAlias(user.getAlias());
        userDTO.setPassword(user.getPassword());
        userDTO.setRoleId(user.getRoleId());
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
        user.setRoleId(userDTO.getRoleId());
        return user;
    }
}
