package iut.sae.saeconnectback.dtos;

import lombok.Data;

@Data
public class AuthLoginResponseDTO {
    private Long userId;
    private String alias;
    private String token;
    private Long roleId;
    private String firstname;
    private String lastname;
    private int expires_in;
}
