package com.choongang.yeonsolution.standard.am.service.impl;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.domain.UserDetailsDto;
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
			return new UserDetailsDto(memberDto);
		}
		
		return null;
	}
}
