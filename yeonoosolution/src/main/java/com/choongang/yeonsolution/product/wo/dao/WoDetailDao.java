package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface WoDetailDao {
	public List<WoDetail> selectWoDetail(String workOrderCode);
	
}
