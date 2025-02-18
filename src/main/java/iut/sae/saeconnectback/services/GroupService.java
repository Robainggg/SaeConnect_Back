package iut.sae.saeconnectback.services;

import iut.sae.saeconnectback.dtos.GroupDto;
import iut.sae.saeconnectback.dtos.GroupStudentDto;
import iut.sae.saeconnectback.repositories.GroupRepository;
import iut.sae.saeconnectback.repositories.GroupStudentRepository;
import org.apache.catalina.Group;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {
    private final GroupRepository groupRepository;
    private final GroupStudentRepository groupStudentRepository;

    public GroupService(GroupRepository groupRepository, GroupStudentRepository groupStudentRepository) {
        this.groupRepository = groupRepository;
        this.groupStudentRepository = groupStudentRepository;
    }

    public List<GroupDto> getAllGroups() {
        return groupRepository.findAll();
    }

    public void save(GroupDto group) {
        groupRepository.save(group);
    }

    public void saveGroupStudent(GroupStudentDto groupStudent) {
        groupStudentRepository.save(groupStudent);
    }

    public List<GroupStudentDto> getGroupStudentsByGroupId(Long groupId) {
        return this.groupStudentRepository.findByGroupeId(groupId);
    }
}
