package com.choongang.yeonsolution.product.wo.dao;

import lombok.RequiredArgsConstructor;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Wh;

@Repository
@RequiredArgsConstructor
public class WhDaoImpl implements WhDao {
	private final SqlSession session;
	
	@Override
	public Wh selectWh(String whCode) {
		return session.selectOne("selectWh", whCode);
	}
}
