package com.choongang.yeonsolution.standard.um.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.choongang.yeonsolution.standard.bi.domain.MemberDto;
import com.choongang.yeonsolution.standard.um.dao.UmDao;
import com.choongang.yeonsolution.standard.um.domain.DepartmentDto;
import com.choongang.yeonsolution.standard.um.domain.JobDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class UmServiceImpl implements UmService {
	private final UmDao umDao;
	//private final PasswordEncoder passwordEncoder;
	private final static BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	@Override
	public MemberDto findMyInfoByMemberUid(MemberDto memberDto) {
		
		return umDao.selectMyInfoByMemberUid(memberDto);
	}

	@Override
	public List<DepartmentDto> findDeptList() {
	
		return umDao.selectDeptList();
	}

	@Override
	public List<JobDto> findJobList() {
		
		return umDao.selectJobList();
	}

	@Override
	public int modifyMemberImageByMemberUid(String memberUid, MultipartFile file, HttpServletRequest request) throws IOException {
		MemberDto memberDto = new MemberDto();
		
		// 이미지가 저장될 경로 
		// C:\Users\User\git\yeonoosolution\src\main\webapp\\upload\profile\COMPANY1.admin@yeonoo.com\
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/profile/"+memberUid+"/");
		log.info("uploadPath -> {} ", uploadPath);
		
		// 디비에 경로까지 저장하기 위해 contextPath까지만 분리시키고 \\profile\(자기아이디)FQGFW@YEONOO.COM는 파일 명에 붙일 예정
		// C:\Users\User\git\yeonoosolution\src\main\webapp
		String paramUploadPath = uploadPath.substring(0, uploadPath.lastIndexOf("\\upload"));
		log.info("paramUploadPath -> {} ", paramUploadPath);
		
		String extension 		= null; // 확장자
		String savedName 		= null;	// 저장될 파일 이름
		File   convertFile	 	= null;	// 최종 변환 파일
		String deleteName		= null; // 이미지를 교체하면 삭제할 기존 이미지
		
		deleteName = paramUploadPath+umDao.selectMemberImageByMemberUid(memberUid);
		
		// db에 이미지 경로가 저장되어 있다면 파일 삭제.
		if(deleteName != null) {
			int delResult = imgDelete(deleteName);
			if(delResult == 1) {
				log.info("삭제 성공");
			}else {
				log.info("삭제 실패");
			}
		}
		
		// 업로드할 이미지파일이 들어왔다면.
		if(file != null && !file.isEmpty()) {
			extension = FilenameUtils.getExtension(file.getOriginalFilename());
			savedName = uploadFile(file.getBytes(), uploadPath, memberDto, extension);
			convertFile = new File(paramUploadPath+savedName);
			FileCopyUtils.copy(file.getBytes(), convertFile);
		}
		memberDto.setMemberUid(memberUid);
		memberDto.setMemberImage(savedName);
		
		int result = umDao.updateMemberImageByMemberUid(memberDto);
		
		
		return result;
	}
	
	// 이미지를 삭제하는 로직 
	private int imgDelete(String deleteName) {
		int result = 0;
		
		File file = new File(deleteName);
		// 파일이 존재한다면
		if(file.exists()) {
			file.delete();
			log.info("삭제 성공");
			result = 1;
		}
		return result;
	}
	
	// 이미지를 업로드하는 로직
	private String uploadFile(byte[] bytes, String uploadPath, MemberDto memberDto, String extension) {
		
		// db에 저장될 경로
		// \\upload\profile\COMPANY1.admin@yeonoo.com\ 
		String extractedPath = uploadPath.substring(uploadPath.lastIndexOf("\\upload"));
		log.info("extractedPath -> {} ", extractedPath);
		
		// 폴더가 없으면 폴더 생성
		// 로그인한 사용자의 uid(COMPANY1.admin@yeonoo.com)가 폴더 이름이 됨.
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdirs();
		}
		
		// 이미지 랜덤이름 값 설정
		UUID uuid = UUID.randomUUID();
		
		// 혹시 겹칠 수도 있으니 타임스탬프까지.
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
		String formattedTime = currentTime.format(formatter);
		
		
		// 이렇게 하면 jsp에서 pageContext를 부를 필요가 없음.
		// \\upload\profile\COMPANY1.admin@yeonoo.com\338afbdf-a7d8-4e30-a0c4-799aac97ba8720230531211608843.jpg
		// \\upload\profile\COMPANY1.admin@yeonoo.com\ + 338afbdf-a7d8-4e30-a0c4-799aac97ba87 + 20230531211608843 + . + jpg
		String savedName = extractedPath+uuid +formattedTime + "." + extension;
		log.info("완성된 이미지 이름 -> {} ", savedName);
		
		
		return savedName;
	}

	@Override
	public int modifyMyInfoByMemberUid(MemberDto memberDto) {
		
		int result = 0;
		
		// 검증용
		String memberUid = memberDto.getMemberUid();
		String dbPassword = umDao.selectDbPasswordByMemberUid(memberUid);
		log.info("dbpassword -> {} ", dbPassword);
		log.info("memberDto.getPassword();-> {} ", passwordEncoder.encode(memberDto.getPassword()));
		Boolean pwdBool = passwordEncoder.matches(memberDto.getPassword(), dbPassword);
		log.info("비번 체크-> {} ", pwdBool);
		if(pwdBool) {
			result = umDao.updateMyInfoByMemberUid(memberDto);
		} else {
			return 2;
		}
		return result;
	}

	@Override
	public int modifyMyPasswordByMemberUid(MemberDto memberDto) {
		// return 0 => 에러발생
		// return 1 => 비밀번호 변경 성공
		// return 2 => 입력한 비밃번호와 db비밀번호가 일치하지 않음.
		// return 3 => 변경할 비밀번호가 전달되지 않음.
		
		int result = 0;
		
		// js에서 검증햇지만 혹시 몰라서 한번 더 검증
		if(memberDto.getChangePassword().equals("")) {
			return 3;
		}

		// 입력한 비번과 db비번이  맞는지 검증용
		String memberUid = memberDto.getMemberUid();
		String dbPassword = umDao.selectDbPasswordByMemberUid(memberUid);
		
		// 내가 입력한 비밀번호(raw password(암호화전  => 1234))와 암호화된 비밀번호를 넣어 비교하여 같으면 true 다르면 false 리턴
		Boolean chkPassword = passwordEncoder.matches(memberDto.getPassword(), dbPassword);
		
		
		log.info("내가 바꾸려는 비번 복호화 전 -> {} ", memberDto.getChangePassword());
		log.info("내가 바꾸려는 비번 복호화 후 -> {} ", passwordEncoder.encode(memberDto.getChangePassword()));
		log.info("비번 체크 -> {} ", chkPassword);
		// 현재 비밀번호와 db비밀번호가 일치한다면 수정작업 시작 
		if(chkPassword) {
			// 암호화
			memberDto.setChangePassword(passwordEncoder.encode(memberDto.getChangePassword()));
			result = umDao.updateMyPasswordByMemberUid(memberDto);
		}else {
			result = 2;
		}
		
		return result;
	}
	
	// 부서 등록
	
	@Override
	public List<DepartmentDto> findDeptListByDeptName(String deptName) {
		
		return umDao.selectDeptListByDeptName(deptName);
	}

	@Override
	public int modifyDeptByDeptCode(DepartmentDto departmentDto) {
		
		return umDao.updateDeptByDeptCode(departmentDto);
	}

	@Override
	public int addDeptBydeptName(DepartmentDto departmentDto) {
		// return 0 : 등록 실패
		// return 1 : 정상 등록
		// return 2 : 이름 중복
		
		int result = 0;
		
		// 같은 이름의 부서가 존재하는 검증하는 로직
		String dbDeptName = umDao.selectDbDeptNameByDeptName(departmentDto);
		log.info("dbDeptName -> {} ",dbDeptName);
		log.info("내가 등록하려는 deptName -> {} ", departmentDto.getDeptName());
		
		if(dbDeptName == null) {
			result = umDao.insertDeptByDeptName(departmentDto);			
		} else {
			return 2;
		}
		return result;
	}

	@Override
	public List<MemberDto> findMemberByDeptCode(MemberDto memberDto) {
		
		return umDao.selectMemberByDeptCode(memberDto);
	}
	
	// 직급등록 및 확인	

	@Override
	public int modifyJobByJobCode(JobDto jobDto) {
		int result = 0;
		
		return umDao.updateJobByJobCode(jobDto);
	}

	@Override
	public int addJobByJobName(JobDto jobDto) {
		// return 0 : 등록 실패
		// return 1 : 정상 등록
		// return 2 : 이름 중복
		
		int result = 0;
		// 같은 이름의 부서가 존재하는 검증하는 로직
		String dbJobName = umDao.selectDbJobNameByJobName(jobDto);
		
		if(dbJobName == null) {
			result = umDao.insertJobByJobName(jobDto);	
		} else {
			return 2;
		}
		return result;
	}

	@Override
	public List<JobDto> findjobListByJobName(String jobName) {
		
		return umDao.selectJobListByJobName(jobName);
	
	}

	@Override
	public List<MemberDto> findMemberByJobCode(MemberDto memberDto) {
		
		return umDao.selectMemberByJobCode(memberDto);
	}
	
	

}
