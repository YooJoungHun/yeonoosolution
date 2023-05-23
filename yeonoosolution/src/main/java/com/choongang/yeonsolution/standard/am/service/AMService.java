package com.choongang.yeonsolution.standard.am.service;

import com.choongang.yeonsolution.standard.am.domain.AMDto;

public interface AMService {
	public AMDto findUserByMemberId(String memberId);
}
