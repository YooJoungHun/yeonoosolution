package com.choongang.yeonsolution.standard.am.service;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface AMService {
	public MemberDto findMemberByMemberId(String memberId);

	public int addMember(MemberDto memberDto);
	
	public boolean isAuthenticated();
	
}
