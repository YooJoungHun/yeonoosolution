package com.choongang.yeonsolution.standard.bi.domain;

import lombok.Data;

@Data
public class MemberDto {
	private String memberUid;
	private String deptCode;
	private String jobCode;
	private String companyCode;
	private String memberId;
	private String password;
	private String memberName;
	private String address;
	private String tel;
	private String memberImage;
	private String memberRole;
	private String regUser;
	private String regDate;
	private String updateUser;
	private String updateDate;
	
	// 찬규 추가
	private String changePassword;
	private String deptName;
	private String jobName;
	private String kind;
}
