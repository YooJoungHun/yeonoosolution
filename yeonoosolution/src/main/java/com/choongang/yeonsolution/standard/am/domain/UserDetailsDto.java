package com.choongang.yeonsolution.standard.am.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;


/**
 * Security 위임 로그인을 위한 UserDetails 구현체
 * @author user
 * @since 2023/05/24
 */
@Getter
@AllArgsConstructor
public class UserDetailsDto implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	
	private MemberDto memberDto;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority(memberDto.getDeptCode()));
		roles.add(new SimpleGrantedAuthority(memberDto.getMemberRole()));
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

	@Override
	public boolean isAccountNonExpired() {
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}

	@Override
	public boolean isEnabled() {
		return false;
	}

}
