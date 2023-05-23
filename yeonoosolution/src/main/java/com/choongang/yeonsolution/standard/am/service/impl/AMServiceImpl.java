package com.choongang.yeonsolution.standard.am.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

@Service
public class AMServiceImpl implements AMService{
	
	private final AMDao amDao;
	
	@Autowired
	public AMServiceImpl(AMDao amDao) {
		this.amDao = amDao;
	}

	@Override
	public AMDto findUserByMemberId(String memberId) {
		return amDao.selectUserByMemberId(memberId);
	}

}
