package iut.sae.saeconnectback.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;

@Component
public class JwtTokenUtil {

    private static String SECRET_KEY;

    @Value("${jwt.expiration.time}")
    private static int expirationToken;

    private static SecretKey KEY;

    @Value("${jwt.secret}")
    public void setSecret(String secret) {
        SECRET_KEY = secret;
        KEY = Keys.hmacShaKeyFor(SECRET_KEY.getBytes());
    }


    public static String generateToken(String alias) {
        return Jwts.builder()
                .setSubject(alias)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + expirationToken))  // Token valable 1 heure
                .signWith(KEY, SignatureAlgorithm.HS256)
                .compact();
    }


}
