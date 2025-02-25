package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.entities.Group;
import iut.sae.saeconnectback.entities.User;
import iut.sae.saeconnectback.mappers.GroupMapper;
import iut.sae.saeconnectback.repositories.GroupRepository;
import iut.sae.saeconnectback.repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {
    private final GroupRepository groupRepository;
    private final UserRepository userRepository;

    public GroupService(GroupRepository groupRepository, UserRepository userRepository) {
        this.groupRepository = groupRepository;
        this.userRepository = userRepository;
    }

    public List<GroupDTO> getAllGroups() {
        List<Group> groups = groupRepository.findAll();
        return groups.stream().map(GroupMapper::toDTO).toList();
    }

    public void save(GroupDTO groupDTO) {
        List<User> users = userRepository.findAllById(groupDTO.getIdUsers());
        Group group = GroupMapper.toEntity(groupDTO, users);
        groupRepository.save(group);
    }


}
