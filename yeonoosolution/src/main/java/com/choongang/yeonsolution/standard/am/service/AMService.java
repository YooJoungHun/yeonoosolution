package com.choongang.yeonsolution.standard.am.service;

import com.choongang.yeonsolution.standard.am.domain.AMDto;

public interface AMService {
	public AMDto findMemberByMemberId(String memberId);
	
	public String login(AMDto amDto);
}
