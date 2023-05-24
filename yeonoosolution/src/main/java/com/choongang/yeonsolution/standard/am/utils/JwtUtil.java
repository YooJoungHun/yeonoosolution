package com.choongang.yeonsolution.standard.am.utils;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtUtil {
	
	private final String secretKey;
	private final Long validDuration;
	
	public JwtUtil(@Value("${jwt.secret}") String secretKey, @Value("${jwt.duration}") Long validDuration) {
		this.secretKey = secretKey;
		this.validDuration = validDuration;
	}
	
	public String createJwt(String memberId) {
		
		//토큰 내부에 데이터를 저장할 수 있는 일종의 Map
		Claims claims = Jwts.claims();
		//사용할 데이터들을 Clame에 put
		claims.put("memberId", memberId);
		
		return Jwts.builder()
				   .setClaims(claims)
				   .setIssuedAt(new Date(System.currentTimeMillis())) //발행 날짜
				   .setExpiration(new Date(System.currentTimeMillis() + validDuration))
				   .signWith(SignatureAlgorithm.HS256, secretKey)
				   .compact();
	}
	
}//end class
