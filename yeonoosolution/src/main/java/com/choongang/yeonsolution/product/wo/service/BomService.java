package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

public interface BomService {
	public List<Bom> findBomWithQuantity(WoDetail forBOM);
	
}
