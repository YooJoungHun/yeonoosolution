package com.choongang.yeonsolution.product.is.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ISDaoImpl implements ISDao {
	private final SqlSession sqlSession;
	
}
