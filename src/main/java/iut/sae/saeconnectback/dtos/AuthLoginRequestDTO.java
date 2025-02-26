package iut.sae.saeconnectback.dtos;

import lombok.Data;

@Data
public class AuthLoginRequestDTO {
    private String alias;
    private String password;
}
