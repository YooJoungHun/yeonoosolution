package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.sim.domain.StInDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SIMDaoImpl implements SIMDao {
	private final SqlSession session;

	@Override
	public List<StInDto> findStIn() {
		List<StInDto> findStIn = null;
		findStIn = session.selectList("selectStIn");
		return findStIn;
	}

}
