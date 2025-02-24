package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.dtos.UserDTO;
import iut.sae.saeconnectback.entities.User;

import java.util.stream.Collectors;

public class UserMapper {
    public static UserDTO toDto(User user){
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setFirstname(user.getFirstname());
        userDTO.setLastname(user.getLastname());
        userDTO.setAlias(user.getAlias());
        userDTO.setGroupIds(user.getGroups().stream().map(GroupDTO::getId).collect(Collectors.toList()));
    }
}
