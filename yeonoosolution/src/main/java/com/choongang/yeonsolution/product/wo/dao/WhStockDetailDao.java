package com.choongang.yeonsolution.product.wo.dao;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface WhStockDetailDao {
	public WhStockDetail selectWhStockDetail(String itemCode);
	public int updateWhStockDetailWithWoDetail(Bom bom);
	
}
