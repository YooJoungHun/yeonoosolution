package com.choongang.yeonsolution.product.wo.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WhStockDetailDao;
import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WhStockDetailServiceImpl implements WhStockDetailService {
	private final WhStockDetailDao whStockDetailDao;
	
	@Override
	public WhStockDetail findWhStockDetail(String itemCode) {
		return whStockDetailDao.selectWhStockDetail(itemCode);
	}
}
