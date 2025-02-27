package iut.sae.saeconnectback.dtos;

import lombok.Data;

@Data
public class AuthLoginResponseDTO {
    private String token;
    private Long roleId;
    private String firstname;
    private String lastname;
}
