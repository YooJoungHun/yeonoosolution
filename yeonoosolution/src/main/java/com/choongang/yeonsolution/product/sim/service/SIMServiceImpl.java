package com.choongang.yeonsolution.product.sim.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.sim.dao.SIMDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SIMServiceImpl implements SIMService {
	private final SIMDao simDao;
	@Override
	public void st() { simDao.st(); }

}
