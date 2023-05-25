package com.choongang.yeonsolution.standard.am.security;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.Getter;


/**
 * Security 위임 로그인을 위한 UserDetails 구현체
 * @author user
 * @since 2023/05/24
 */
@Getter
public class UserDetailsDto extends User implements Serializable {
	
	private MemberDto memberDto;
	Collection<GrantedAuthority> roles;
	
	public UserDetailsDto(MemberDto memberDto, Collection<GrantedAuthority> roles) {
		super(memberDto.getMemberId(), memberDto.getPassword(), roles);
		this.memberDto = memberDto;
		this.roles = roles;
	}
	
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		return roles;
	}

	@Override
	public String getPassword() {
		return memberDto.getPassword();
	}

	@Override
	public String getUsername() {
		return memberDto.getMemberId();
	}
	
}
