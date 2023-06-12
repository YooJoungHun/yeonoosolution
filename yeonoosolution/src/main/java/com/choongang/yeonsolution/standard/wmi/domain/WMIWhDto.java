package com.choongang.yeonsolution.standard.wmi.domain;

import lombok.Data;

@Data
public class WMIWhDto {
	
	private String	whCode;
	private String	companyCode;
	private String	whName;
	private String	regUser;
	private String	regDate;
	private String	updateUser;
	private String	updateDate;
	private	String	useYn;
	private String	memo;
	
	// list 순서
	private long	rn;
	
	// 수정 삭제 구분 번호
	private long	kindN;
	
	// 회원 join
	private String	regUserName;
	private String	updateUserName;
	
	private	String	memberName;
}
