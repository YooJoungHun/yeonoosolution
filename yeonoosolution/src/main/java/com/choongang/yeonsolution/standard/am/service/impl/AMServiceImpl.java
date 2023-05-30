package com.choongang.yeonsolution.standard.am.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
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
		String defaultRole = "USER";
		//비밀번호 암호화
		memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
		//defaultRole 세팅
		memberDto.setMemberRole(defaultRole);
		return amDao.insertMember(memberDto);
	}

	@Override
	public boolean isAuthenticated() {
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || AnonymousAuthenticationToken.class.isAssignableFrom(authentication.getClass())) {
				return false;
			}
		return authentication.isAuthenticated();
	}

	@Override
	public List<AMDto> findMemberListByCompanyCode(String companyCode) {
		List<AMDto> memberList = amDao.selectMemberListByCompanyCode(companyCode);
		return memberList;
	}

	@Override
	public List<AMDto> findCompanyList() {
		List<AMDto> companyList = amDao.selectCompanyList();
		return companyList;
	}

	@Override
	public List<AMDto> findDepartmentList() {
		List<AMDto> departmentList = amDao.selectDepartmentList();
		return departmentList;
	}

	@Override
	public List<AMDto> findJobList() {
		List<AMDto> jobList = amDao.selectJobList();
		return jobList;
	}

}
