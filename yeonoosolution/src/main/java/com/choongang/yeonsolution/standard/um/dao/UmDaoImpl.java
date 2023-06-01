package com.choongang.yeonsolution.standard.um.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.um.domain.DepartmentDto;
import com.choongang.yeonsolution.standard.um.domain.JobDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class UmDaoImpl implements UmDao {
	private final SqlSession session;

	@Override
	public MemberDto selectMyInfoByMemberUid(MemberDto memberDto) {
		MemberDto memberDtoList = null;
		try {
			memberDtoList = session.selectOne("umSelectMyInfoByMemberUid", memberDto);
		} catch (Exception e) {
			log.error("dao selectMyInfoByMemberUid 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return memberDtoList;
	}

	@Override
	public List<DepartmentDto> selectDeptList() {
		List<DepartmentDto> departmentDtoList = null;
		try {
			departmentDtoList = session.selectList("umSelectDeptList");
		} catch (Exception e) {
			log.error("dao selectDeptList 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return departmentDtoList;
	}

	@Override
	public List<JobDto> selectJobList() {
		List<JobDto> jobDtoList = null;
		try {
			jobDtoList = session.selectList("umSelectJobList");
		} catch (Exception e) {
			log.error("dao selectJobList 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return jobDtoList;
	}

	@Override
	public int updateMemberImageByMemberUid(MemberDto memberDto) {
		int result = 0;
		try {
			result = session.update("umUpdateMemberImageByMemberUid", memberDto);
		} catch (Exception e) {
			log.error("dao updateMemberImageByMemberId 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public String selectMemberImageByMemberUid(String memberUid) {
		String deletedName = null;
		try {
			deletedName = session.selectOne("umSelectMemberImageByMemberUid", memberUid);
		} catch (Exception e) {
			log.error("dao selectDeleteImageByMemberId 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return deletedName;
	}

	@Override
	public String selectDbPasswordByMemberUid(String memberId) {
		String dbPassword = null;
		try {
			dbPassword = session.selectOne("umSelectDbPasswordByMemberUid", memberId);
		} catch (Exception e) {
			log.error("dao selectDbPasswordByMemberId 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return dbPassword;
	}

	@Override
	public int updateMyInfoByMemberUid(MemberDto memberDto) {
		int result = 0;
		try {
			result = session.update("umUpdateMyInfoByMemberUid", memberDto);
		} catch (Exception e) {
			log.error("dao updateMyInfoByMemberId 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int updateMyPasswordByMemberUid(MemberDto memberDto) {
		int result = 0;
		try {
			result = session.update("umUpdateMyPasswordByMemberUid", memberDto);
		} catch (Exception e) {
			log.error("dao updateMyPasswordByMemberId 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<DepartmentDto> selectDeptListByDeptName(String deptName) {
		List<DepartmentDto> departmentDto = null;
		try {
			departmentDto = session.selectList("umSelectDeptListByDeptName", deptName);
		} catch (Exception e) {
			log.error("dao selectDeptListByDeptName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return departmentDto;
	}

	@Override
	public int updateDeptByDeptCode(DepartmentDto departmentDto) {
		int result = 0;
		try {
			result = session.update("umUpdateDeptByDeptCode", departmentDto);
		} catch (Exception e) {
			log.error("dao departmentDto 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int insertDeptByDeptName(DepartmentDto departmentDto) {
		int result = 0;
		try {
			result = session.insert("umInsertDeptByDeptName", departmentDto);
		} catch (Exception e) {
			log.error("dao insertDeptByDeptName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public String selectDbDeptNameByDeptName(DepartmentDto departmentDto) {
		String dbDeptName = null;
		try {
			dbDeptName = session.selectOne("umSelectDbDeptNameByDeptName",departmentDto);
		} catch (Exception e) {
			log.error("dao selectDbDeptNameByDeptName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return dbDeptName;
	}

	@Override
	public List<MemberDto> selectMemberByDeptCode(MemberDto memberDto) {
		List<MemberDto> memberDtoList = null;
		try {
			memberDtoList = session.selectList("umSelectMemberByDeptCode", memberDto);
		} catch (Exception e) {
			log.error("dao selectMemberByDeptCode 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return memberDtoList;
	}
	
	// 직급등록 및 확인

	@Override
	public int updateJobByJobCode(JobDto jobDto) {
		int result = 0;
		try {
			result = session.update("umUpdateJobByJobCode", jobDto);
		} catch (Exception e) {
			log.error("dao umUpdateJobByJobCode 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int insertJobByJobName(JobDto jobDto) {
		int result = 0;
		try {
			result = session.insert("umInsertJobByJobName", jobDto);
		} catch (Exception e) {
			log.error("dao insertJobByJobName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public String selectDbJobNameByJobName(JobDto jobDto) {
		String dbJobName = null;
		try {
			dbJobName = session.selectOne("umSelectDbJobNameByJobName", jobDto);
		} catch (Exception e) {
			log.error("dao selectDbJobNameByJobName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return dbJobName;
	}

	@Override
	public List<JobDto> selectJobListByJobName(String jobName) {
		List<JobDto> jobDto = null;
		try {
			jobDto = session.selectList("umSelectJobListByJobName", jobName);			
		} catch (Exception e) {
			log.error("dao selectJobListByJobName 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return jobDto;
	}

	@Override
	public List<MemberDto> selectMemberByJobCode(MemberDto memberDto) {
		List<MemberDto> memberDtoList = null;
		try {
			memberDtoList = session.selectList("umSelectMemberByJobCode", memberDto);
		} catch (Exception e) {
			log.error("dao selectMemberByJobCode 에러-> {} ",e.getMessage());
			// TODO: handle exception
		}
		return memberDtoList;
	}
}
