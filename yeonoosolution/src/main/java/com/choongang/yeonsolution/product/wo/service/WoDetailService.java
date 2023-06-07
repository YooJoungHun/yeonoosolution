package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface WoDetailService {
	public List<WoDetail> findWoDetail(String workOrderCode);
	
}
