package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface BomDao {
	public List<Bom> selectBomWithQuantity(WoDetail forBOM);
}
