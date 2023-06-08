package com.choongang.yeonsolution.standard.um.domain;

import lombok.Data;

@Data
public class JobDto {
	private String jobCode;
	private String jobName;
	private String jobYn;
	private String regUser;
	private String regDate;
	private String updateUser;
	private String updateDate;
	
	// 추가
	private String memberUid;
	private String kind;
}
