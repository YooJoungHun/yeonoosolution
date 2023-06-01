package com.choongang.yeonsolution.product.wo.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WhDao;
import com.choongang.yeonsolution.product.wo.domain.Wh;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WhServiceImpl implements WhService {
	private final WhDao whDao;
	
	@Override
	public Wh findWh(String whCode) {
		return whDao.selectWh(whCode);
	}
}
