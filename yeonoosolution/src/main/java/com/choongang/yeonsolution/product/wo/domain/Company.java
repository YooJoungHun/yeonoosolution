package com.choongang.yeonsolution.product.wo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Company {
	private String companyCode; // PK
	private String businessType;
	private String orderType;
	private String companyName;
	private String businessCode;
	private String ownerName;
	private String tel;
	private String address;
	private String companyLogo;
	private String regUser;
	private Date regDate;
	private String updateUser;
	private Date updateDate;
}
