package com.choongang.yeonsolution.standard.am.service;

import java.util.List;

import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface AMService {
	public MemberDto findMemberByMemberId(String memberId);

	public int addMember(MemberDto memberDto);
	
	public boolean isAuthenticated();

	public List<AMDto> findMemberListByCompanyCode(String companyCode);
	
}
