package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class  UserDTO {
    private Long id;
    private String firstname;
    private String lastname;
    private String alias;
    @JsonIgnore
    private String password;
    private Long roleId;
    private List<Long> groupIds;
}
