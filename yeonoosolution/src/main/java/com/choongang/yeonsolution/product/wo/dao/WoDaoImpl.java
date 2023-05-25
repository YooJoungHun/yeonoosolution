package com.choongang.yeonsolution.product.wo.dao;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Wo;

@Repository
@RequiredArgsConstructor
public class WoDaoImpl implements WoDao {
	private final SqlSession session;
	
	@Override
	public List<Wo> selectWo() {
		return session.selectList("selectWo");
	}
}
