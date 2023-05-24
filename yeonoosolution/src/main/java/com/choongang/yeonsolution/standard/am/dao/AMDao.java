package com.choongang.yeonsolution.standard.am.dao;

import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface AMDao {
	public MemberDto selectMemberByMemberId(String memberId);

	public int insertMember(MemberDto memberDto);
}
