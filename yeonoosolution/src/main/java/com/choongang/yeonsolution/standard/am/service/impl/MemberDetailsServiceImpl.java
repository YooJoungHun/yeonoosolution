package com.choongang.yeonsolution.standard.am.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 * SecurityConfig에서 loginProcessing Url으로 설정한 url이 요청되면
 * Spring Security가 로그인 기능을 위임받아서 처리할 때 호출되는 서비스구현체와 메서드
 * @author 장성태
 * @since 2023/05/24
 */
@Service
@Slf4j
@AllArgsConstructor
public class MemberDetailsServiceImpl implements UserDetailsService {
	
	private final AMService amService;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		log.info("[loadUserByUsername] memberId : {}", memberId);
		
		MemberDto memberDto = amService.findMemberByMemberId(memberId);
		
		if (memberDto != null) {
			
			UserDetailsDto userDetailsDto = new UserDetailsDto(memberDto, getRoles(memberDto));
			log.info("[loadUserByUsername] userDetailsDto : {}", userDetailsDto);
			
			return userDetailsDto;
		}
		
		throw new BadCredentialsException("No such id or wrong password");
	}
	
	private Collection<GrantedAuthority> getRoles(MemberDto memberDto) {
		Collection<GrantedAuthority> roles = new ArrayList<>();
		String deptRoleName = deptCodeToDeptName(memberDto.getDeptCode());
		roles.add(new SimpleGrantedAuthority("ROLE_" + deptRoleName));
		roles.add(new SimpleGrantedAuthority("ROLE_" + memberDto.getMemberRole()));
		
		return roles;
	}
	
	/**
	 * deptCode를 authorization에 사용하기 위해 deptRoleName으로 변환
	 * 나눠진 패키지를 기준으로 url을 통한 접근권한 제어
	 * @param deptCode
	 * @return deptRoleName
	 */
	private String deptCodeToDeptName(String deptCode) {
		
		if (deptCode != null) {
			
			switch (deptCode) {
			//여누솔루션
			case "DEPARTMENT0":
				return "YEONOO";
			//생산, 개발
			case "DEPARTMENT1":
			case "DEPARTMENT5":
				return "PRODUCT";
			//경영, 구매, 마케팅	
			case "DEPARTMENT2":
			case "DEPARTMENT3":
			case "DEPARTMENT4":
				return "SALES";
			//인사	
			case "DEPARTMENT6":
				return "STANDARD";
				
			default: 
				return "NULL";
			}
			
		} else {
			return null;
		}
		
	}
}//end class
