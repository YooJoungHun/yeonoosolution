package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BomDaoImpl implements BomDao {
	private final SqlSession session;
	
	@Override
	public List<Bom> selectBomWithQuantity(WoDetail forBOM) {
		return session.selectList("selectBomWithQuantity", forBOM);
	}
}
