package com.choongang.yeonsolution.standard.ipi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class IPIDaoImpl implements IPIDao {
	
	private final SqlSession sqlSession;
	
}
