package com.choongang.yeonsolution.standard.am.dao;

import com.choongang.yeonsolution.standard.am.domain.AMDto;

public interface AMDao {
	public AMDto selectUserByMemberId(String memberId);
}
