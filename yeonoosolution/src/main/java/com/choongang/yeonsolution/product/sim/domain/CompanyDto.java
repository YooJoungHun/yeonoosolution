package com.choongang.yeonsolution.product.sim.domain;


import java.util.Date;

import lombok.Data;

@Data
public class CompanyDto {
	private String 	companyCode;
	private String 	businessType;
	private String 	orderType;
	private String 	companyName;
	private String 	businessCode;
	private String 	ownerName;
	private String 	tel;
	private String 	address;
	private String	companyLogo;
	private Date 	regDate;
	private String 	regUser;
	private String 	updateUser;
	private Date	updateDate;
	private String 	useYn;
}