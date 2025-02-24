package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.GroupDTO;
import iut.sae.saeconnectback.repositories.GroupRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {
    private final GroupRepository groupRepository;

    public GroupService(GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    public List<GroupDTO> getAllGroups() {
        return groupRepository.findAll();
    }

    public void save(GroupDTO group) {
        groupRepository.save(group);
    }


}
