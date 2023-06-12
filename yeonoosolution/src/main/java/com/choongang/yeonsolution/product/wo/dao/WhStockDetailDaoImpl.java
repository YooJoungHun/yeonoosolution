package com.choongang.yeonsolution.product.wo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WhStockDetailDaoImpl implements WhStockDetailDao {
	private final SqlSession session;
	
	@Override
	public WhStockDetail selectWhStockDetail(String itemCode) {
		return session.selectOne("selectWhStockDetail", itemCode);
	}
	@Override
	public int updateWhStockDetailWithWoDetail(Bom bom) {
		return session.update("updateWhStockDetailWithWoDetail", bom);
	}
}
