package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WoDao;
import com.choongang.yeonsolution.product.wo.domain.Wo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WoServiceImpl implements WoService {
	private final WoDao wod;
	
	@Override
	public List<Wo> findWo() {
		return wod.selectWo();
	}
}
