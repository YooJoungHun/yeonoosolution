package com.choongang.yeonsolution.standard.imi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class IMIDaoImpl implements IMIDao {
	
	private final SqlSession sqlSession;

}
