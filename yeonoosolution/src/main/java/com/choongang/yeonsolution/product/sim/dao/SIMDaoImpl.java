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
	public void st() {
		List<StInDto> inDtos = session.selectList("test1");
		System.out.println(inDtos);
	}

}
