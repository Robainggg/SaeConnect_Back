package iut.sae.saeconnectback.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
public class AuthRegisterRequestDTO {

    @NotBlank
    @Size(min = 8)
    private String firstname;

    @NotBlank
    @Size(min = 8)
    private String lastname;

    @NotBlank
    @Size(min = 8)
    @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
            message = "Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre, un caractère spécial et faire au moins 8 caractères."
    )
    private String password;

    @NotBlank
    @JsonProperty(value = "role_id")
    private Long roleId;
}