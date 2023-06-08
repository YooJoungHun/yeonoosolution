package com.choongang.yeonsolution.standard.um.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.um.domain.DepartmentDto;
import com.choongang.yeonsolution.standard.um.domain.JobDto;

public interface UmService {

	MemberDto findMyInfoByMemberUid(MemberDto memberDto);

	List<DepartmentDto> findDeptList();

	List<JobDto> findJobList();

	int modifyMemberImageByMemberUid(String memberUid, MultipartFile file, HttpServletRequest request) throws IOException;

	int modifyMyInfoByMemberUid(MemberDto memberDto);

	int modifyMyPasswordByMemberUid(MemberDto memberDto);

	List<DepartmentDto> findDeptListByDeptName(String deptName);

	int modifyDeptByDeptCode(DepartmentDto departmentDto);

	int addDeptBydeptName(DepartmentDto departmentDto);

	List<MemberDto> findMemberByDeptCode(MemberDto memberDto);

	int modifyJobByJobCode(JobDto jobDto);

	int addJobByJobName(JobDto jobDto);

	List<JobDto> findjobListByJobName(String jobName);

	List<MemberDto> findMemberByJobCode(MemberDto memberDto);


}
