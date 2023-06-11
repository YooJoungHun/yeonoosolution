package com.choongang.yeonsolution.product.wo.service;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface WhStockDetailService {
	public WhStockDetail findWhStockDetail(String itemCode);
	public int modifyWhStockDetailWithWoDetail(Bom bom);
	
}
