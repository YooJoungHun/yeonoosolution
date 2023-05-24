package com.choongang.yeonsolution.standard.am.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AuthProvider implements AuthenticationProvider{
	
	private final AMService amService;
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public AuthProvider(AMService amService, PasswordEncoder passwordEncoder) {
		this.amService = amService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		log.info("[authenticate] test pass : {}", passwordEncoder.encode("1"));
		String memberId = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		AMDto foundMember = amService.findMemberByMemberId(memberId);
		
		//로그인이 성공할 경우 role 설정 후 token 발급
		if (foundMember != null && passwordEncoder.matches(password, foundMember.getPassword())) {
			List<GrantedAuthority> roles = new ArrayList<>();
			roles.add(new SimpleGrantedAuthority(foundMember.getDeptCode()));
			roles.add(new SimpleGrantedAuthority(foundMember.getMemberRole()));
			
			return new UsernamePasswordAuthenticationToken(foundMember.getMemberId(), null, roles);
		}
		
		throw new BadCredentialsException("No such user or wrong password");
	}
	

}
