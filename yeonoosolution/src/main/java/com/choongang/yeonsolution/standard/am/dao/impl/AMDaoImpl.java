package com.choongang.yeonsolution.standard.am.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

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
	public MemberDto selectMemberByMemberId(String memberId) {
		log.info("[selectMemberByMemberId] memberId : {}", memberId);
		MemberDto memberDto = sqlSession.selectOne("selectMemberByMemberId", memberId);
		log.info("[selectMemberByMemberId] amDto : {}", memberDto);
		return memberDto;
	}

	@Override
	public int insertMember(MemberDto memberDto) {
		log.info("[insertMember] memberDto : {}", memberDto);
		int result = sqlSession.insert("insertMember", memberDto);
		log.info("[insertMember] result : {}", result);
		return result;
	}

	@Override
	public List<AMDto> selectMemberListByCompanyCode(String companyCode) {
		log.info("[selectMemberListByCompanyCode] companyCode : {}", companyCode);
		List<AMDto> amDtoList = sqlSession.selectList("selectMemberListByCompanyCode", companyCode);
		log.info("[selectMemberListByCompanyCode] amDtoList : {}", amDtoList);
		return amDtoList;
	}

}
