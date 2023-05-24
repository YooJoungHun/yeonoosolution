package com.choongang.yeonsolution.standard.am.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.service.AMService;
import com.choongang.yeonsolution.standard.am.utils.JwtUtil;

@Service
public class AMServiceImpl implements AMService{
	
	private final AMDao amDao;
	private final JwtUtil jwtUtil;
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public AMServiceImpl(AMDao amDao, JwtUtil jwtUtil, PasswordEncoder passwordEncoder) {
		this.amDao = amDao;
		this.jwtUtil = jwtUtil;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public AMDto findMemberByMemberId(String memberId) {
		return amDao.selectMemberByMemberId(memberId);
	}
	
	@Override
	public String login(AMDto amDto) {
		String rawMemberId = amDto.getMemberId();
		String rawPassword = amDto.getPassword();
		
		AMDto foundMember = amDao.selectMemberByMemberId(rawMemberId);
		
		return jwtUtil.createJwt(rawMemberId);
		
	}

}
