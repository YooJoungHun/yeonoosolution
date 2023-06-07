package com.choongang.yeonsolution.product.wo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.WhStockDetail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WhStockDetailDaoImpl implements WhStockDetailDao {
	private final SqlSession session;
	
	@Override
	public WhStockDetail selectWhStockDetail(String itemCode) {
		return session.selectOne("selectWhStockDetail", itemCode);
	}
}
