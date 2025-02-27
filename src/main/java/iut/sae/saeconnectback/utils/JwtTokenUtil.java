package iut.sae.saeconnectback.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Base64;
import java.util.Date;

@Component
public class JwtTokenUtil {

    private static String SECRET_KEY;

    private static SecretKey KEY;

    @Value("${jwt.secret}")
    public void setSecret(String secret) {
        SECRET_KEY = secret;
        KEY = Keys.hmacShaKeyFor(Base64.getEncoder().encode(SECRET_KEY.getBytes()));
    }


    public static String generateToken(String alias) {
        return Jwts.builder()
                .setSubject(alias)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 3600000))  // Token valable 1 heure
                .signWith(KEY, SignatureAlgorithm.HS256)
                .compact();
    }


}
