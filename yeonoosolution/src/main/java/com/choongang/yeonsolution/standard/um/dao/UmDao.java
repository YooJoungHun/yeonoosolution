package com.choongang.yeonsolution.standard.um.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.um.domain.DepartmentDto;
import com.choongang.yeonsolution.standard.um.domain.JobDto;

public interface UmDao {

	MemberDto selectMyInfoByMemberUid(MemberDto memberDto);

	List<DepartmentDto> selectDeptList();

	List<JobDto> selectJobList();

	int updateMemberImageByMemberUid(MemberDto memberDto);

	String selectMemberImageByMemberUid(String memberUid);

	String selectDbPasswordByMemberUid(String memberId);

	int updateMyInfoByMemberUid(MemberDto memberDto);

	int updateMyPasswordByMemberUid(MemberDto memberDto);

	List<DepartmentDto> selectDeptListByDeptName(String deptName);

	int updateDeptByDeptCode(DepartmentDto departmentDto);

	int insertDeptByDeptName(DepartmentDto departmentDto);

	String selectDbDeptNameByDeptName(DepartmentDto departmentDto);

	List<MemberDto> selectMemberByDeptCode(MemberDto memberDto);

	int updateJobByJobCode(JobDto jobDto);

	int insertJobByJobName(JobDto jobDto);

	String selectDbJobNameByJobName(JobDto jobDto);

	List<JobDto> selectJobListByJobName(String jobName);

	List<MemberDto> selectMemberByJobCode(MemberDto memberDto);


}
