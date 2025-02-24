package iut.sae.saeconnectback.dtos;

import lombok.Data;

import java.util.List;

@Data
public class GroupDTO  {
    private Long id;
    private String nom;
    private List<Long> idUsers;

}