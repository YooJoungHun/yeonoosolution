package com.choongang.yeonsolution.sales.pm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PmCompanyDto {
	
	private String companyCode;
	private String businessType;
	private String orderType;
	private String companyName;
	private String businessCode;
	private String ownerName;
	private String tel;
	private String address;
	private String companyLogo;
	private String regDate;
	private String regUser;
	private String updateUser;
	private String updateDate;
	private String useYn;

}