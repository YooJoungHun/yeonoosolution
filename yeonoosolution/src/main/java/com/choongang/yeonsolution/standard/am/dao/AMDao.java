package com.choongang.yeonsolution.standard.am.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface AMDao {
	public MemberDto selectMemberByMemberId(String memberId);
	
	public MemberDto selectMember(String memberUid);

	public int insertMember(MemberDto memberDto);

	public List<AMDto> selectMemberListByCompanyCode(String companyCode);

	public List<AMDto> selectCompanyList();

	public List<AMDto> selectDepartmentList();

	public List<AMDto> selectJobList();

	public int updateMember(MemberDto memberDto);

	public List<AMDto> selectMemberListByKeword(AMDto keywordDto);
	
}
