package iut.sae.saeconnectback.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;

import java.util.Date;

public class JwtTokenUtil {

    @Value("${jwt.secret}")
    private static String SECRET_KEY;  // Change ça par une clé secrète plus sécurisée

    // Méthode pour générer un token JWT
    public static String generateToken(String alias) {
        return Jwts.builder()
                .setSubject(alias)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 3600000))  // Token valable 1 heure
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                .compact();
    }

}
