package com.choongang.yeonsolution.standard.am.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.standard.am.dao.AMDao;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.service.AMService;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AMServiceImpl implements AMService{
	
	private final AMDao amDao;
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public AMServiceImpl(AMDao amDao, PasswordEncoder passwordEncoder) {
		this.amDao = amDao;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public MemberDto findMemberByMemberId(String memberId) {
		return amDao.selectMemberByMemberId(memberId);
	}

	@Override
	public int addMember(MemberDto memberDto) {
		String defaultRole = "USER";
		//비밀번호 암호화
		memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
		//defaultRole 세팅
		memberDto.setMemberRole(defaultRole);
		return amDao.insertMember(memberDto);
	}

	@Override
	public boolean isAuthenticated() {
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || AnonymousAuthenticationToken.class.isAssignableFrom(authentication.getClass())) {
				return false;
			}
		return authentication.isAuthenticated();
	}

	@Override
	public List<AMDto> findMemberListByCompanyCode(String companyCode) {
		List<AMDto> memberList = amDao.selectMemberListByCompanyCode(companyCode);
		return memberList;
	}

	@Override
	public List<AMDto> findCompanyList() {
		List<AMDto> companyList = amDao.selectCompanyList();
		return companyList;
	}

	@Override
	public List<AMDto> findDepartmentList() {
		List<AMDto> departmentList = amDao.selectDepartmentList();
		return departmentList;
	}

	@Override
	public List<AMDto> findJobList() {
		List<AMDto> jobList = amDao.selectJobList();
		return jobList;
	}

	@Override
	public int membersSaveByMemberList(List<MemberDto> memberList) {
		
		int result = 0;
		
		try {
			Field[] fields = MemberDto.class.getDeclaredFields();
			for (MemberDto memberDto : memberList) {
				if (memberDto.getMemberUid() != null) {
					MemberDto foundMemberDto = amDao.selectMember(memberDto.getMemberUid());
			        for (Field field : fields) {
			        	//필드 접근 허용
			            field.setAccessible(true);
			            
			            try {
							if (field.get(memberDto) != null) {
								//field.set(해당 필드값을 set 할 인스턴스, set 해줄 값)
								field.set(foundMemberDto, field.get(memberDto));
							}
						} catch (IllegalArgumentException e) {
							e.printStackTrace();
						} catch (IllegalAccessException e) {
							e.printStackTrace();
						}
			        }
			        
					result = amDao.updateMember(foundMemberDto);
					
				} else {
					//초기비밀번호 : 아이디
					memberDto.setPassword(passwordEncoder.encode(memberDto.getMemberId()));
					memberDto.setRegUser(memberDto.getUpdateUser());
					result = amDao.insertMember(memberDto);
				}
			}
			
		} catch (Exception e) {
			result = -1;
		}
		
		return result;
		
	}

	/**
	 * 키워드를 한글자씩 나누어서 사이에 %를 추가하여 LIKE문을 변경
	 * @param keyword
	 */
	private String getKeywordBuilder(String keyword) {
		StringBuilder keywordBuilder = new StringBuilder();
		
	    for (int i = 0; i < keyword.length(); i++) {
	        keywordBuilder.append(keyword.charAt(i));
	        if (i < keyword.length() - 1) {
	            keywordBuilder.append("%");
	        }
	    }
		return keywordBuilder.toString();
	}
	
	@Override
	public List<AMDto> findMemberListByKeyword(AMDto keywordDto) {
		String nameKeyword = keywordDto.getNameKeyword().replaceAll("\\s+", "");;
		String idKeyword = keywordDto.getIdKeyword().trim().replaceAll("\\s+", "");;
		
		nameKeyword = getKeywordBuilder(nameKeyword);
		idKeyword = getKeywordBuilder(idKeyword);	
		
		log.info("[findMemberListByKeyword] nameKeyword : {}, idKeyword : {}", nameKeyword, idKeyword);
		
		keywordDto.setNameKeyword(nameKeyword);
		keywordDto.setIdKeyword(idKeyword);
		
		List<AMDto> memberList = amDao.selectMemberListByKeword(keywordDto);
		return memberList;
	}

}
