package com.choongang.yeonsolution.standard.am.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AMDaoImpl implements AMDao{
	
	private final SqlSession sqlSession;
	
	@Autowired
	public AMDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public AMDto selectMemberByMemberId(String memberId) {
		log.info("[selectMemberByMemberId] memberId : {}", memberId);
		AMDto amDto = sqlSession.selectOne("selectMemberByMemberId", memberId);
		log.info("[selectMemberByMemberId] amDto : {}", amDto);
		return amDto;
	}

}
