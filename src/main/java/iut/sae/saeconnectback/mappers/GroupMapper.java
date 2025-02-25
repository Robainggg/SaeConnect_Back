package iut.sae.saeconnectback.mappers;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.entities.Group;
import iut.sae.saeconnectback.entities.User;

import java.util.List;
import java.util.stream.Collectors;

public class GroupMapper {

    public static GroupDTO toDTO(Group group) {
        GroupDTO dto = new GroupDTO();
        dto.setId(group.getId());
        dto.setNom(group.getNom());
        if(group.getUsers() != null)
            dto.setIdUsers(group.getUsers().stream().map(User::getId).collect(Collectors.toList()));

        return dto;
    }

    public static Group toEntity(GroupDTO dto, List<User> users) {
        Group group = new Group();
        group.setId(dto.getId());
        group.setNom(dto.getNom());
        group.setUsers(users);
        return group;
    }
}
