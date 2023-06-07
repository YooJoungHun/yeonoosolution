package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WoDetailDao;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WoDetailServiceImpl implements WoDetailService {
	private final WoDetailDao woDetailDao;
	
	@Override
	public List<WoDetail> findWoDetail(String workOrderCode) {
		return woDetailDao.selectWoDetail(workOrderCode);
	}
}
