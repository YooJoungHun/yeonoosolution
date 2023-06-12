package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.BomDao;
import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BomServiceImpl implements BomService {
	private final BomDao bomDao;
	
	@Override
	public List<Bom> findBomWithQuantity(WoDetail forBOM) {
		return bomDao.selectBomWithQuantity(forBOM);
	}
}
