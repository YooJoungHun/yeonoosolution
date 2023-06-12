package com.choongang.yeonsolution.product.wo.service;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WhStockDetailDao;
import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WhStockDetailServiceImpl implements WhStockDetailService {
	private final WhStockDetailDao whStockDetailDao;
	
	@Override
	public WhStockDetail findWhStockDetail(String itemCode) {
		return whStockDetailDao.selectWhStockDetail(itemCode);
	}
	@Override
	public int modifyWhStockDetailWithWoDetail(Bom bom) {
		return whStockDetailDao.updateWhStockDetailWithWoDetail(bom);
	}
}
