package com.choongang.yeonsolution.standard.am.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

@Service
@Transactional
public class AMServiceImpl implements AMService{
	
	private final AMDao amDao;
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public AMServiceImpl(AMDao amDao, PasswordEncoder passwordEncoder) {
		this.amDao = amDao;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public MemberDto findMemberByMemberId(String memberId) {
		return amDao.selectMemberByMemberId(memberId);
	}

	@Override
	public int addMember(MemberDto memberDto) {
		memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
		return amDao.insertMember(memberDto);
	}

}
