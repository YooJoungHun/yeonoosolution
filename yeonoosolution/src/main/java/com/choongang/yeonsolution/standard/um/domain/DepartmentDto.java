package com.choongang.yeonsolution.standard.um.domain;

import lombok.Data;

@Data
public class DepartmentDto {
	private String deptCode;
	private String deptName;
	private String deptYn;
	private String regUser;
	private String regDate;
	private String updateUser;
	private String updateDate;
	
	// 추가
	private String memberUid;
	private String kind;
	
}
