package com.choongang.yeonsolution.product.wo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Item;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ItemDaoImpl implements ItemDao {
	private final SqlSession session;
	
	@Override
	public Item selectItem(String itemCode) {
		return session.selectOne("selectItem", itemCode);
	}
}
