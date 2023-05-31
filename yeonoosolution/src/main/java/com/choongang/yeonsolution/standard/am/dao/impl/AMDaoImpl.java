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
		MemberDto memberDto = sqlSession.selectOne("amSelectMemberByMemberId", memberId);
		log.info("[selectMemberByMemberId] amDto : {}", memberDto);
		return memberDto;
	}
	

	@Override
	public MemberDto selectMember(String memberUid) {
		log.info("[selectMember] memberUid : {}", memberUid);
		MemberDto memberDto = sqlSession.selectOne("amSelectMember", memberUid);
		log.info("[selectMember] memberDto : {}", memberDto);
		return memberDto;
	}


	@Override
	public int insertMember(MemberDto memberDto) {
		log.info("[insertMember] memberDto : {}", memberDto);
		int result = sqlSession.insert("amInsertMember", memberDto);
		log.info("[insertMember] result : {}", result);
		return result;
	}

	@Override
	public List<AMDto> selectMemberListByCompanyCode(String companyCode) {
		log.info("[selectMemberListByCompanyCode] companyCode : {}", companyCode);
		List<AMDto> memberList = sqlSession.selectList("amSelectMemberListByCompanyCode", companyCode);
		log.info("[selectMemberListByCompanyCode] amDtoList : {}", memberList);
		return memberList;
	}

	@Override
	public List<AMDto> selectCompanyList() {
		List<AMDto> companyList = sqlSession.selectList("amSelectCompanyList");
		log.info("[selectCompanyList] companyList : {}", companyList);
		return companyList;
	}

	@Override
	public List<AMDto> selectDepartmentList() {
		List<AMDto> departmentList = sqlSession.selectList("amSelectDepartmentList");
		log.info("[selectDepartmentList] departmentList : {}", departmentList);
		return departmentList;
	}

	@Override
	public List<AMDto> selectJobList() {
		List<AMDto> jobList = sqlSession.selectList("amSelectJobList");
		log.info("[selectJobList] jobList : {}", jobList);
		return jobList;
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		int result = 0;
		log.info("[updateMemberByMemberUid] memberUid : {}", memberDto);
		result = sqlSession.update("amUpdateMember", memberDto);
		log.info("[updateMemberByMemberUid] result : {}", result);
		return result;
	}

	@Override
	public List<AMDto> selectMemberListByKeword(AMDto keywordDto) {
		log.info("[selectMemberListByNameKeword] keywordDto : {}", keywordDto);
		List<AMDto> memberList = sqlSession.selectList("amSelectMemberListByKeword", keywordDto);
		log.info("[selectMemberListByNameKeword] memberList : {}", memberList);
		return memberList;
	}

}
