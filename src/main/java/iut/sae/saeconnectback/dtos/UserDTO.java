package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import iut.sae.saeconnectback.entities.Role;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import java.util.List;

@Data
public class  UserDTO {
    private Long id;

    @NotBlank
    @Size(min = 1, max = 50)
    private String firstname;

    @NotBlank
    @Size(min = 1, max = 50)
    private String lastname;

    private String alias;

    @JsonIgnore
    @NotBlank
    @Size(min = 8)
    @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
            message = "Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre, un caractère spécial et faire au moins 8 caractères."
    )
    private String password;

    @NotNull
    private Role role;


    private List<Long> groupIds;
}
