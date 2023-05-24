package com.choongang.yeonsolution.standard.pmi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PMIDaoImpl implements PMIDao {
	
	private final SqlSession sqlSession;
}
